; DESCRIPTION: Places a green line segment connecting (211, 212) to (228, 72).
; PLAN: r0=211(x1), r1=212(y1), r2=228(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 212
LDI r2, 228
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
