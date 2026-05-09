; DESCRIPTION: Renders a black line between points (370, 56) and (338, 127).
; PLAN: r0=370(x1), r1=56(y1), r2=338(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 56
LDI r2, 338
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
