; DESCRIPTION: Places a cyan line segment connecting (112, 66) to (172, 208).
; PLAN: r0=112(x1), r1=66(y1), r2=172(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 66
LDI r2, 172
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
