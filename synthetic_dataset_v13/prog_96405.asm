; DESCRIPTION: Renders a blue line between points (207, 49) and (81, 215).
; PLAN: r0=207(x1), r1=49(y1), r2=81(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 49
LDI r2, 81
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
