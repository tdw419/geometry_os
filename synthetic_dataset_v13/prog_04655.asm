; DESCRIPTION: Composite: Places a yellow line segment connecting (21, 58) to (57, 153) then Creates a cyan rectangular region at (24, 213) spanning 106 by 12 pixels.
; PLAN: r0=21(x1), r1=58(y1), r2=57(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=24(x), r6=213(y), r7=106(width), r8=12(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 21
LDI r1, 58
LDI r2, 57
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 213
LDI r7, 106
LDI r8, 12
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
