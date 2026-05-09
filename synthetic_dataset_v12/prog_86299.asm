; DESCRIPTION: Places a cyan line segment connecting (152, 164) to (112, 232).
; PLAN: r0=152(x1), r1=164(y1), r2=112(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 164
LDI r2, 112
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
