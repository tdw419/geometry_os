; DESCRIPTION: Renders a black line between points (150, 150) and (52, 197).
; PLAN: r0=150(x1), r1=150(y1), r2=52(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 150
LDI r2, 52
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
