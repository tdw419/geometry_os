; DESCRIPTION: Renders a blue line between points (257, 65) and (284, 163).
; PLAN: r0=257(x1), r1=65(y1), r2=284(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 65
LDI r2, 284
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
