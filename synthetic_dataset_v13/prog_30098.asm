; DESCRIPTION: Draws a green line from (261, 150) to (152, 136).
; PLAN: r0=261(x1), r1=150(y1), r2=152(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 150
LDI r2, 152
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
