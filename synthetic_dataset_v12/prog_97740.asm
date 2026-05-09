; DESCRIPTION: Places a cyan line segment connecting (154, 252) to (226, 155).
; PLAN: r0=154(x1), r1=252(y1), r2=226(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 252
LDI r2, 226
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
