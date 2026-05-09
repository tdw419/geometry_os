; DESCRIPTION: Draws a black line from (279, 136) to (257, 221).
; PLAN: r0=279(x1), r1=136(y1), r2=257(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 136
LDI r2, 257
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
