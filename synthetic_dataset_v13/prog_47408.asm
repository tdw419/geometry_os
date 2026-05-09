; DESCRIPTION: Places a cyan line segment connecting (264, 2) to (122, 191).
; PLAN: r0=264(x1), r1=2(y1), r2=122(x2), r3=191(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 2
LDI r2, 122
LDI r3, 191
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
