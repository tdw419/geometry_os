; DESCRIPTION: Places a cyan line segment connecting (414, 52) to (408, 74).
; PLAN: r0=414(x1), r1=52(y1), r2=408(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 52
LDI r2, 408
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
