; DESCRIPTION: Places a cyan line segment connecting (357, 45) to (137, 228).
; PLAN: r0=357(x1), r1=45(y1), r2=137(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 45
LDI r2, 137
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
