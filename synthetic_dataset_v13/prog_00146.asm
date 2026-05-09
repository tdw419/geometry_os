; DESCRIPTION: Places a cyan line segment connecting (211, 170) to (228, 149).
; PLAN: r0=211(x1), r1=170(y1), r2=228(x2), r3=149(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 170
LDI r2, 228
LDI r3, 149
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
