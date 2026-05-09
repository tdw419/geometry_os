; DESCRIPTION: Renders a white line between points (434, 145) and (421, 52).
; PLAN: r0=434(x1), r1=145(y1), r2=421(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 145
LDI r2, 421
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
