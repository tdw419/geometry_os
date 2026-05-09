; DESCRIPTION: Draws a blue line from (187, 139) to (224, 219).
; PLAN: r0=187(x1), r1=139(y1), r2=224(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 139
LDI r2, 224
LDI r3, 219
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
