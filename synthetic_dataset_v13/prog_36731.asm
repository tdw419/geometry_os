; DESCRIPTION: Draws a green line from (440, 250) to (256, 155).
; PLAN: r0=440(x1), r1=250(y1), r2=256(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 250
LDI r2, 256
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
