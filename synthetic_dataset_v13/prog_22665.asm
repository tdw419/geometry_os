; DESCRIPTION: Places a cyan line segment connecting (59, 23) to (241, 105).
; PLAN: r0=59(x1), r1=23(y1), r2=241(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 23
LDI r2, 241
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
