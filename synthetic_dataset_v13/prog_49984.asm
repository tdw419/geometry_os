; DESCRIPTION: Composite: Creates a black rectangular region at (87, 211) spanning 44 by 22 pixels then Draws a yellow line from (382, 167) to (275, 48).
; PLAN: r0=87(x), r1=211(y), r2=44(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=382(x1), r6=167(y1), r7=275(x2), r8=48(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 87
LDI r1, 211
LDI r2, 44
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 167
LDI r7, 275
LDI r8, 48
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
