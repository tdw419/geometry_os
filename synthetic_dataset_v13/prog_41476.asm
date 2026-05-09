; DESCRIPTION: Places a cyan line segment connecting (232, 66) to (196, 47).
; PLAN: r0=232(x1), r1=66(y1), r2=196(x2), r3=47(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 66
LDI r2, 196
LDI r3, 47
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
