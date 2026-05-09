; DESCRIPTION: Places a purple line segment connecting (42, 233) to (416, 197).
; PLAN: r0=42(x1), r1=233(y1), r2=416(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 233
LDI r2, 416
LDI r3, 197
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
