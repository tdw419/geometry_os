; DESCRIPTION: Renders a blue line between points (464, 182) and (329, 81).
; PLAN: r0=464(x1), r1=182(y1), r2=329(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 182
LDI r2, 329
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
