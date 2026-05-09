; DESCRIPTION: Places a cyan line segment connecting (183, 57) to (24, 58).
; PLAN: r0=183(x1), r1=57(y1), r2=24(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 57
LDI r2, 24
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
