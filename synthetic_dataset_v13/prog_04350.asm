; DESCRIPTION: Places a cyan line segment connecting (464, 219) to (158, 67).
; PLAN: r0=464(x1), r1=219(y1), r2=158(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 219
LDI r2, 158
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
