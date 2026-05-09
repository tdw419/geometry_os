; DESCRIPTION: Draws a yellow line from (320, 125) to (218, 132).
; PLAN: r0=320(x1), r1=125(y1), r2=218(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 125
LDI r2, 218
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
