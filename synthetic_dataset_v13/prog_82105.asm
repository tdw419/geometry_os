; DESCRIPTION: Composite: Places a cyan circle of radius 22 at center (97, 124) then Renders a blue line between points (299, 35) and (381, 51) then Renders a blue box of size 23x97 starting at (199, 45).
; PLAN: r0=97(x), r1=124(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=299(x1), r6=35(y1), r7=381(x2), r8=51(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=199(x), r11=45(y), r12=23(width), r13=97(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 97
LDI r1, 124
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 299
LDI r6, 35
LDI r7, 381
LDI r8, 51
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 199
LDI r11, 45
LDI r12, 23
LDI r13, 97
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
