; DESCRIPTION: Draws a black line from (168, 19) to (454, 115).
; PLAN: r0=168(x1), r1=19(y1), r2=454(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 19
LDI r2, 454
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
