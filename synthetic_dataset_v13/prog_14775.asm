; DESCRIPTION: Composite: Places a cyan circle of radius 15 at center (465, 230) then Places a black line segment connecting (13, 95) to (332, 55) then Places a orange dot at position (503, 227).
; PLAN: r0=465(x), r1=230(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=13(x1), r6=95(y1), r7=332(x2), r8=55(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=503(x), r11=227(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 465
LDI r1, 230
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 13
LDI r6, 95
LDI r7, 332
LDI r8, 55
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 503
LDI r11, 227
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
