; DESCRIPTION: Places a cyan line segment connecting (127, 212) to (163, 43).
; PLAN: r0=127(x1), r1=212(y1), r2=163(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 212
LDI r2, 163
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
