; DESCRIPTION: Places a cyan line segment connecting (339, 63) to (152, 112).
; PLAN: r0=339(x1), r1=63(y1), r2=152(x2), r3=112(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 63
LDI r2, 152
LDI r3, 112
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
