; DESCRIPTION: Draws a green line from (453, 22) to (257, 253).
; PLAN: r0=453(x1), r1=22(y1), r2=257(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 22
LDI r2, 257
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
