; DESCRIPTION: Renders a black line between points (334, 197) and (455, 196).
; PLAN: r0=334(x1), r1=197(y1), r2=455(x2), r3=196(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 197
LDI r2, 455
LDI r3, 196
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
