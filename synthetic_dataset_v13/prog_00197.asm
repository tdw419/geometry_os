; DESCRIPTION: Draws a green line from (207, 144) to (203, 84).
; PLAN: r0=207(x1), r1=144(y1), r2=203(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 144
LDI r2, 203
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
