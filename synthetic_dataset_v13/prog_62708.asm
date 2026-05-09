; DESCRIPTION: Draws a black line from (356, 236) to (380, 78).
; PLAN: r0=356(x1), r1=236(y1), r2=380(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 236
LDI r2, 380
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
