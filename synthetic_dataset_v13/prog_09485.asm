; DESCRIPTION: Draws a blue line from (251, 84) to (239, 248).
; PLAN: r0=251(x1), r1=84(y1), r2=239(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 84
LDI r2, 239
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
