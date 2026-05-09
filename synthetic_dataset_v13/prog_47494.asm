; DESCRIPTION: Draws a magenta line from (464, 11) to (329, 222).
; PLAN: r0=464(x1), r1=11(y1), r2=329(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 11
LDI r2, 329
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
