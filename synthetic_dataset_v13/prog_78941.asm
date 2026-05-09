; DESCRIPTION: Draws a magenta line from (435, 32) to (81, 31).
; PLAN: r0=435(x1), r1=32(y1), r2=81(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 32
LDI r2, 81
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
