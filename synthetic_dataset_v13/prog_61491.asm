; DESCRIPTION: Renders a black line between points (32, 30) and (497, 182).
; PLAN: r0=32(x1), r1=30(y1), r2=497(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 30
LDI r2, 497
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
