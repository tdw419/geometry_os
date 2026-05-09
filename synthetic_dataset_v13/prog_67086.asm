; DESCRIPTION: Places a cyan line segment connecting (78, 151) to (355, 65).
; PLAN: r0=78(x1), r1=151(y1), r2=355(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 151
LDI r2, 355
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
