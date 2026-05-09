; DESCRIPTION: Places a blue line segment connecting (478, 171) to (224, 193).
; PLAN: r0=478(x1), r1=171(y1), r2=224(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 171
LDI r2, 224
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
