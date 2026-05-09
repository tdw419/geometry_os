; DESCRIPTION: Draws a black line from (503, 195) to (195, 95).
; PLAN: r0=503(x1), r1=195(y1), r2=195(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 195
LDI r2, 195
LDI r3, 95
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
