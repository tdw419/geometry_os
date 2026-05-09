; DESCRIPTION: Draws a magenta line from (320, 15) to (153, 122).
; PLAN: r0=320(x1), r1=15(y1), r2=153(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 15
LDI r2, 153
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
