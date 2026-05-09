; DESCRIPTION: Renders a blue line between points (195, 215) and (98, 3).
; PLAN: r0=195(x1), r1=215(y1), r2=98(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 215
LDI r2, 98
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
