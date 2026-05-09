; DESCRIPTION: Renders a black line between points (510, 61) and (502, 74).
; PLAN: r0=510(x1), r1=61(y1), r2=502(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 61
LDI r2, 502
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
