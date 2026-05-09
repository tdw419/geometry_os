; DESCRIPTION: Draws a yellow line from (55, 215) to (84, 205).
; PLAN: r0=55(x1), r1=215(y1), r2=84(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 215
LDI r2, 84
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
