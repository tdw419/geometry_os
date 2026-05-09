; DESCRIPTION: Draws a black line from (90, 31) to (263, 153).
; PLAN: r0=90(x1), r1=31(y1), r2=263(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 31
LDI r2, 263
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
