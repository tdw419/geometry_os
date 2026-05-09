; DESCRIPTION: Draws a blue line from (375, 133) to (54, 213).
; PLAN: r0=375(x1), r1=133(y1), r2=54(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 133
LDI r2, 54
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
