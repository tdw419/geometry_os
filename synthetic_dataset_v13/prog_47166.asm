; DESCRIPTION: Composite: Sets a single magenta pixel at (332, 88) then Places a purple line segment connecting (96, 209) to (440, 239).
; PLAN: r0=332(x), r1=88(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=96(x1), r6=209(y1), r7=440(x2), r8=239(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 332
LDI r1, 88
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 96
LDI r6, 209
LDI r7, 440
LDI r8, 239
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
