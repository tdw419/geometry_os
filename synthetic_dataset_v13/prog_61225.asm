; DESCRIPTION: Places a blue line segment connecting (480, 145) to (257, 146).
; PLAN: r0=480(x1), r1=145(y1), r2=257(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 145
LDI r2, 257
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
