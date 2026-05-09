; DESCRIPTION: Renders a blue line between points (335, 128) and (375, 164).
; PLAN: r0=335(x1), r1=128(y1), r2=375(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 128
LDI r2, 375
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
