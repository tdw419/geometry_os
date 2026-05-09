; DESCRIPTION: Places a cyan line segment connecting (138, 105) to (328, 0).
; PLAN: r0=138(x1), r1=105(y1), r2=328(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 105
LDI r2, 328
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
