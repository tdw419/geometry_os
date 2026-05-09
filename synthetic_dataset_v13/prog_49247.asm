; DESCRIPTION: Composite: Sets a single black pixel at (336, 214) then Renders a red box of size 110x37 starting at (336, 195) then Places a black line segment connecting (194, 180) to (185, 190).
; PLAN: r0=336(x), r1=214(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=336(x), r6=195(y), r7=110(width), r8=37(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=194(x1), r11=180(y1), r12=185(x2), r13=190(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 336
LDI r1, 214
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 336
LDI r6, 195
LDI r7, 110
LDI r8, 37
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 194
LDI r11, 180
LDI r12, 185
LDI r13, 190
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
