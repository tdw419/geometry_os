; DESCRIPTION: Composite: Places a blue line segment connecting (349, 205) to (348, 240) then Renders a white box of size 17x98 starting at (150, 108) then Sets a single purple pixel at (45, 165).
; PLAN: r0=349(x1), r1=205(y1), r2=348(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=150(x), r6=108(y), r7=17(width), r8=98(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=45(x), r11=165(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 349
LDI r1, 205
LDI r2, 348
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 108
LDI r7, 17
LDI r8, 98
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 45
LDI r11, 165
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
