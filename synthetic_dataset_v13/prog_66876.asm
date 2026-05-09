; DESCRIPTION: Renders a blue line between points (223, 141) and (16, 86).
; PLAN: r0=223(x1), r1=141(y1), r2=16(x2), r3=86(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 141
LDI r2, 16
LDI r3, 86
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
