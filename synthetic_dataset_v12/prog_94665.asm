; DESCRIPTION: Composite: Renders a black line between points (22, 13) and (173, 74) then Sets a single black pixel at (485, 8).
; PLAN: r0=22(x1), r1=13(y1), r2=173(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=485(x), r6=8(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 22
LDI r1, 13
LDI r2, 173
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 485
LDI r6, 8
LDI r7, 0x000000
PSET r5, r6, r7
HALT
