; DESCRIPTION: Draws a red line from (257, 242) to (451, 212).
; PLAN: r0=257(x1), r1=242(y1), r2=451(x2), r3=212(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 242
LDI r2, 451
LDI r3, 212
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
