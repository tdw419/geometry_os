; DESCRIPTION: Draws a black line from (48, 255) to (257, 196).
; PLAN: r0=48(x1), r1=255(y1), r2=257(x2), r3=196(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 255
LDI r2, 257
LDI r3, 196
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
