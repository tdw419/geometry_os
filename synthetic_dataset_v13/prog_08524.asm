; DESCRIPTION: Draws a blue line from (257, 24) to (70, 225).
; PLAN: r0=257(x1), r1=24(y1), r2=70(x2), r3=225(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 24
LDI r2, 70
LDI r3, 225
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
