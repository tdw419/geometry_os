; DESCRIPTION: Draws a black line from (399, 245) to (116, 32).
; PLAN: r0=399(x1), r1=245(y1), r2=116(x2), r3=32(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 245
LDI r2, 116
LDI r3, 32
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
