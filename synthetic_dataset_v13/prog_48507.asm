; DESCRIPTION: Places a blue line segment connecting (86, 104) to (228, 226).
; PLAN: r0=86(x1), r1=104(y1), r2=228(x2), r3=226(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 104
LDI r2, 228
LDI r3, 226
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
