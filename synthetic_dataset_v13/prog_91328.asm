; DESCRIPTION: Composite: Renders a blue line between points (468, 170) and (271, 98) then Creates a purple rectangular region at (401, 43) spanning 42 by 66 pixels then Renders a cyan disk with center (356, 126) and radius 15.
; PLAN: r0=468(x1), r1=170(y1), r2=271(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=401(x), r6=43(y), r7=42(width), r8=66(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=356(x), r11=126(y), r12=15(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 468
LDI r1, 170
LDI r2, 271
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 43
LDI r7, 42
LDI r8, 66
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 126
LDI r12, 15
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
