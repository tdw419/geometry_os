; DESCRIPTION: Places a magenta line segment connecting (38, 253) to (456, 86).
; PLAN: r0=38(x1), r1=253(y1), r2=456(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 253
LDI r2, 456
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
