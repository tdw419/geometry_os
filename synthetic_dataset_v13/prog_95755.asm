; DESCRIPTION: Composite: Places a cyan line segment connecting (187, 25) to (494, 153) then Creates a blue rectangular region at (325, 13) spanning 22 by 99 pixels.
; PLAN: r0=187(x1), r1=25(y1), r2=494(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=325(x), r6=13(y), r7=22(width), r8=99(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 187
LDI r1, 25
LDI r2, 494
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 13
LDI r7, 22
LDI r8, 99
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
