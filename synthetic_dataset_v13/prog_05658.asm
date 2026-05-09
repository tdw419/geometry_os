; DESCRIPTION: Places a purple line segment connecting (127, 221) to (412, 168).
; PLAN: r0=127(x1), r1=221(y1), r2=412(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 221
LDI r2, 412
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
