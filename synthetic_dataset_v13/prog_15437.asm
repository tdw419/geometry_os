; DESCRIPTION: Draws a black line from (257, 214) to (356, 28).
; PLAN: r0=257(x1), r1=214(y1), r2=356(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 214
LDI r2, 356
LDI r3, 28
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
