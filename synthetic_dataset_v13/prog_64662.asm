; DESCRIPTION: Draws a black line from (380, 127) to (19, 125).
; PLAN: r0=380(x1), r1=127(y1), r2=19(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 127
LDI r2, 19
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
