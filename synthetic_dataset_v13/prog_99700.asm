; DESCRIPTION: Renders a blue line between points (224, 206) and (437, 179).
; PLAN: r0=224(x1), r1=206(y1), r2=437(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 206
LDI r2, 437
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
