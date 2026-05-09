; DESCRIPTION: Draws a magenta line from (76, 244) to (331, 37).
; PLAN: r0=76(x1), r1=244(y1), r2=331(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 244
LDI r2, 331
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
