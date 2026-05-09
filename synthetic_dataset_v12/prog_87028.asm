; DESCRIPTION: Renders a green line between points (505, 41) and (464, 39).
; PLAN: r0=505(x1), r1=41(y1), r2=464(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 41
LDI r2, 464
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
