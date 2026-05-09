; DESCRIPTION: Places a cyan line segment connecting (149, 212) to (414, 167).
; PLAN: r0=149(x1), r1=212(y1), r2=414(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 212
LDI r2, 414
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
