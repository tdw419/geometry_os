; DESCRIPTION: Renders a black line between points (464, 35) and (213, 157).
; PLAN: r0=464(x1), r1=35(y1), r2=213(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 35
LDI r2, 213
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
