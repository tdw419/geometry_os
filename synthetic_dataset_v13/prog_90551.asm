; DESCRIPTION: Renders a black line between points (317, 37) and (265, 40).
; PLAN: r0=317(x1), r1=37(y1), r2=265(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 37
LDI r2, 265
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
