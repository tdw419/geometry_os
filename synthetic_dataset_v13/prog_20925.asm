; DESCRIPTION: Renders a blue line between points (126, 220) and (349, 175).
; PLAN: r0=126(x1), r1=220(y1), r2=349(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 220
LDI r2, 349
LDI r3, 175
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
