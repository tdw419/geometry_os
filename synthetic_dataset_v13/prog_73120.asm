; DESCRIPTION: Composite: Renders a black line between points (470, 216) and (511, 215) then Sets a single purple pixel at (263, 63).
; PLAN: r0=470(x1), r1=216(y1), r2=511(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=263(x), r6=63(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 470
LDI r1, 216
LDI r2, 511
LDI r3, 215
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 63
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
