; DESCRIPTION: Renders a black line between points (502, 210) and (348, 51).
; PLAN: r0=502(x1), r1=210(y1), r2=348(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 210
LDI r2, 348
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
