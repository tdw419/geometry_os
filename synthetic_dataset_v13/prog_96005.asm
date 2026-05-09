; DESCRIPTION: Draws a yellow line from (356, 212) to (257, 190).
; PLAN: r0=356(x1), r1=212(y1), r2=257(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 212
LDI r2, 257
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
