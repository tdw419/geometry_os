; DESCRIPTION: Draws a black line from (245, 73) to (454, 182).
; PLAN: r0=245(x1), r1=73(y1), r2=454(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 73
LDI r2, 454
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
