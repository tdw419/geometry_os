; DESCRIPTION: Draws a black line from (176, 187) to (232, 57).
; PLAN: r0=176(x1), r1=187(y1), r2=232(x2), r3=57(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 187
LDI r2, 232
LDI r3, 57
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
