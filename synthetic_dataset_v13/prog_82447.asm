; DESCRIPTION: Draws a magenta line from (240, 23) to (162, 48).
; PLAN: r0=240(x1), r1=23(y1), r2=162(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 23
LDI r2, 162
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
