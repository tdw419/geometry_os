; DESCRIPTION: Renders a black line between points (106, 172) and (257, 210).
; PLAN: r0=106(x1), r1=172(y1), r2=257(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 172
LDI r2, 257
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
