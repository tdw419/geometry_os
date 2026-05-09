; DESCRIPTION: Draws a blue line from (84, 162) to (70, 213).
; PLAN: r0=84(x1), r1=162(y1), r2=70(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 162
LDI r2, 70
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
