; DESCRIPTION: Renders a white line between points (2, 222) and (140, 63).
; PLAN: r0=2(x1), r1=222(y1), r2=140(x2), r3=63(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 222
LDI r2, 140
LDI r3, 63
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
