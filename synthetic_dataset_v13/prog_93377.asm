; DESCRIPTION: Draws a black line from (45, 165) to (64, 115).
; PLAN: r0=45(x1), r1=165(y1), r2=64(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 165
LDI r2, 64
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
