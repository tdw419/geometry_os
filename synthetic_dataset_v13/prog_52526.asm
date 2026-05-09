; DESCRIPTION: Places a magenta line segment connecting (387, 141) to (144, 254).
; PLAN: r0=387(x1), r1=141(y1), r2=144(x2), r3=254(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 141
LDI r2, 144
LDI r3, 254
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
