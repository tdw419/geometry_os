; DESCRIPTION: Places a cyan line segment connecting (424, 183) to (69, 105).
; PLAN: r0=424(x1), r1=183(y1), r2=69(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 183
LDI r2, 69
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
