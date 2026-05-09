; DESCRIPTION: Draws a black line from (174, 218) to (481, 21).
; PLAN: r0=174(x1), r1=218(y1), r2=481(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 218
LDI r2, 481
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
