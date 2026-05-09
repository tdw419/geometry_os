; DESCRIPTION: Renders a black line between points (416, 91) and (113, 140).
; PLAN: r0=416(x1), r1=91(y1), r2=113(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 91
LDI r2, 113
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
