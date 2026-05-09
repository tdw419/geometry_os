; DESCRIPTION: Renders a white line between points (121, 204) and (434, 180).
; PLAN: r0=121(x1), r1=204(y1), r2=434(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 204
LDI r2, 434
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
