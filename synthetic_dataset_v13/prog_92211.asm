; DESCRIPTION: Renders a blue line between points (103, 220) and (273, 28).
; PLAN: r0=103(x1), r1=220(y1), r2=273(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 220
LDI r2, 273
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
