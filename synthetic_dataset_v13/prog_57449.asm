; DESCRIPTION: Renders a blue line between points (30, 195) and (107, 195).
; PLAN: r0=30(x1), r1=195(y1), r2=107(x2), r3=195(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 195
LDI r2, 107
LDI r3, 195
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
