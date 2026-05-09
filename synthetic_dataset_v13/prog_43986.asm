; DESCRIPTION: Draws a black line from (51, 218) to (386, 206).
; PLAN: r0=51(x1), r1=218(y1), r2=386(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 218
LDI r2, 386
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
