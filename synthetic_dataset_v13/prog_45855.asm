; DESCRIPTION: Draws a green line from (198, 125) to (234, 105).
; PLAN: r0=198(x1), r1=125(y1), r2=234(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 125
LDI r2, 234
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
