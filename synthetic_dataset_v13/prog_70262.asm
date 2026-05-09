; DESCRIPTION: Draws a green line from (300, 184) to (435, 49).
; PLAN: r0=300(x1), r1=184(y1), r2=435(x2), r3=49(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 184
LDI r2, 435
LDI r3, 49
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
