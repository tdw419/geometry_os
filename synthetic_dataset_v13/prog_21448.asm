; DESCRIPTION: Draws a black line from (358, 154) to (494, 206).
; PLAN: r0=358(x1), r1=154(y1), r2=494(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 154
LDI r2, 494
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
