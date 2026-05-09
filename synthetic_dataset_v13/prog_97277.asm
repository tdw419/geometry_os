; DESCRIPTION: Places a cyan line segment connecting (461, 109) to (191, 43).
; PLAN: r0=461(x1), r1=109(y1), r2=191(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 109
LDI r2, 191
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
