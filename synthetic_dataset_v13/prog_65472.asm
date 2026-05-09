; DESCRIPTION: Composite: Places a red line segment connecting (401, 132) to (153, 76) then Renders a red box of size 65x88 starting at (266, 92) then Places a black dot at position (422, 140).
; PLAN: r0=401(x1), r1=132(y1), r2=153(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=266(x), r6=92(y), r7=65(width), r8=88(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=422(x), r11=140(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 401
LDI r1, 132
LDI r2, 153
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 92
LDI r7, 65
LDI r8, 88
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 140
LDI r12, 0x000000
PSET r10, r11, r12
HALT
