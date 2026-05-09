; DESCRIPTION: Draws a magenta line from (96, 225) to (416, 26).
; PLAN: r0=96(x1), r1=225(y1), r2=416(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 225
LDI r2, 416
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
