; DESCRIPTION: Renders a blue line between points (125, 28) and (402, 166).
; PLAN: r0=125(x1), r1=28(y1), r2=402(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 28
LDI r2, 402
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
