; DESCRIPTION: Renders a blue line between points (188, 127) and (224, 43).
; PLAN: r0=188(x1), r1=127(y1), r2=224(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 127
LDI r2, 224
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
