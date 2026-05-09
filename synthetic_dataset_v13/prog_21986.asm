; DESCRIPTION: Draws a blue line from (311, 120) to (270, 224).
; PLAN: r0=311(x1), r1=120(y1), r2=270(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 120
LDI r2, 270
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
