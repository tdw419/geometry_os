; DESCRIPTION: Draws a yellow line from (270, 194) to (216, 146).
; PLAN: r0=270(x1), r1=194(y1), r2=216(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 194
LDI r2, 216
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
