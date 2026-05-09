; DESCRIPTION: Renders a blue line between points (132, 175) and (196, 150).
; PLAN: r0=132(x1), r1=175(y1), r2=196(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 175
LDI r2, 196
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
