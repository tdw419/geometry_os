; DESCRIPTION: Places a cyan line segment connecting (355, 68) to (433, 156).
; PLAN: r0=355(x1), r1=68(y1), r2=433(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 68
LDI r2, 433
LDI r3, 156
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
