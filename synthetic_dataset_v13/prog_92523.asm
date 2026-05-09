; DESCRIPTION: Draws a black line from (257, 13) to (333, 110).
; PLAN: r0=257(x1), r1=13(y1), r2=333(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 13
LDI r2, 333
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
