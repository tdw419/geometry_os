; DESCRIPTION: Draws a magenta line from (11, 141) to (320, 33).
; PLAN: r0=11(x1), r1=141(y1), r2=320(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 141
LDI r2, 320
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
