; DESCRIPTION: Renders a black line between points (150, 36) and (19, 21).
; PLAN: r0=150(x1), r1=36(y1), r2=19(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 36
LDI r2, 19
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
