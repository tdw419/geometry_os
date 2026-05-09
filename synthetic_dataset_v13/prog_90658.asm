; DESCRIPTION: Places a magenta line segment connecting (257, 14) to (480, 242).
; PLAN: r0=257(x1), r1=14(y1), r2=480(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 14
LDI r2, 480
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
