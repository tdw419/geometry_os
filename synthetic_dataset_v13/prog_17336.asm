; DESCRIPTION: Renders a white line between points (260, 149) and (175, 122).
; PLAN: r0=260(x1), r1=149(y1), r2=175(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 149
LDI r2, 175
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
