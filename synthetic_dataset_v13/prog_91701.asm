; DESCRIPTION: Draws a black line from (127, 237) to (276, 165).
; PLAN: r0=127(x1), r1=237(y1), r2=276(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 237
LDI r2, 276
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
