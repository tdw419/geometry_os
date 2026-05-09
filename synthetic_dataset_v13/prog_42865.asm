; DESCRIPTION: Draws a magenta line from (138, 12) to (416, 144).
; PLAN: r0=138(x1), r1=12(y1), r2=416(x2), r3=144(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 12
LDI r2, 416
LDI r3, 144
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
