; DESCRIPTION: Draws a yellow line from (329, 86) to (332, 161).
; PLAN: r0=329(x1), r1=86(y1), r2=332(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 86
LDI r2, 332
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
