; DESCRIPTION: Renders a white line between points (270, 198) and (113, 229).
; PLAN: r0=270(x1), r1=198(y1), r2=113(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 198
LDI r2, 113
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
