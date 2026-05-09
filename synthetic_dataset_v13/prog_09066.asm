; DESCRIPTION: Places a cyan line segment connecting (355, 144) to (154, 79).
; PLAN: r0=355(x1), r1=144(y1), r2=154(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 144
LDI r2, 154
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
