; DESCRIPTION: Draws a black line from (241, 178) to (349, 125).
; PLAN: r0=241(x1), r1=178(y1), r2=349(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 178
LDI r2, 349
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
