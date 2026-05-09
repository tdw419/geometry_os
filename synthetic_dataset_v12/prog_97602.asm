; DESCRIPTION: Draws a green line from (283, 172) to (440, 10).
; PLAN: r0=283(x1), r1=172(y1), r2=440(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 172
LDI r2, 440
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
