; DESCRIPTION: Composite: Places a green line segment connecting (117, 240) to (324, 163) then Places a red circle of radius 74 at center (338, 135) then Sets a single cyan pixel at (285, 179).
; PLAN: r0=117(x1), r1=240(y1), r2=324(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=338(x), r6=135(y), r7=74(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=285(x), r11=179(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 117
LDI r1, 240
LDI r2, 324
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 135
LDI r7, 74
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 285
LDI r11, 179
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
