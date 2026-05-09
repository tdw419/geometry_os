; DESCRIPTION: Renders a blue line between points (257, 154) and (87, 107).
; PLAN: r0=257(x1), r1=154(y1), r2=87(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 154
LDI r2, 87
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
