; DESCRIPTION: Renders a black line between points (256, 132) and (123, 247).
; PLAN: r0=256(x1), r1=132(y1), r2=123(x2), r3=247(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 132
LDI r2, 123
LDI r3, 247
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
