; DESCRIPTION: Renders a cyan line between points (357, 170) and (164, 56).
; PLAN: r0=357(x1), r1=170(y1), r2=164(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 170
LDI r2, 164
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
