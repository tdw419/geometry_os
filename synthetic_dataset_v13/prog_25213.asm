; DESCRIPTION: Draws a blue line from (81, 226) to (28, 126).
; PLAN: r0=81(x1), r1=226(y1), r2=28(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 226
LDI r2, 28
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
