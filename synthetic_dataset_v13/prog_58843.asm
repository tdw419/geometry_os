; DESCRIPTION: Renders a white line between points (72, 51) and (502, 120).
; PLAN: r0=72(x1), r1=51(y1), r2=502(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 51
LDI r2, 502
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
