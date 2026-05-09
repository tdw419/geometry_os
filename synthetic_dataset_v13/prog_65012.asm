; DESCRIPTION: Places a green line segment connecting (416, 98) to (14, 168).
; PLAN: r0=416(x1), r1=98(y1), r2=14(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 98
LDI r2, 14
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
