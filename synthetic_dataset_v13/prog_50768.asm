; DESCRIPTION: Draws a green line from (16, 234) to (203, 223).
; PLAN: r0=16(x1), r1=234(y1), r2=203(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 234
LDI r2, 203
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
