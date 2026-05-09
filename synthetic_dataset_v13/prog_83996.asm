; DESCRIPTION: Draws a black line from (358, 152) to (127, 94).
; PLAN: r0=358(x1), r1=152(y1), r2=127(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 152
LDI r2, 127
LDI r3, 94
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
