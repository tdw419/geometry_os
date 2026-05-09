; DESCRIPTION: Composite: Draws a cyan line from (258, 137) to (469, 33) then Creates a yellow rectangular region at (6, 153) spanning 60 by 53 pixels.
; PLAN: r0=258(x1), r1=137(y1), r2=469(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=6(x), r6=153(y), r7=60(width), r8=53(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 258
LDI r1, 137
LDI r2, 469
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 153
LDI r7, 60
LDI r8, 53
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
