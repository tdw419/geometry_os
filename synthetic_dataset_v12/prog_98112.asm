; DESCRIPTION: Places a green line segment connecting (155, 239) to (257, 226).
; PLAN: r0=155(x1), r1=239(y1), r2=257(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 239
LDI r2, 257
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
