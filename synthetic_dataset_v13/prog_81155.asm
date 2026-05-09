; DESCRIPTION: Renders a black line between points (254, 226) and (449, 6).
; PLAN: r0=254(x1), r1=226(y1), r2=449(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 226
LDI r2, 449
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
