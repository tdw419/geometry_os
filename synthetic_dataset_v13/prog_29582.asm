; DESCRIPTION: Draws a black line from (469, 30) to (293, 132).
; PLAN: r0=469(x1), r1=30(y1), r2=293(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 30
LDI r2, 293
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
