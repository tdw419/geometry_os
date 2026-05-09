; DESCRIPTION: Places a magenta line segment connecting (416, 220) to (186, 60).
; PLAN: r0=416(x1), r1=220(y1), r2=186(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 220
LDI r2, 186
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
