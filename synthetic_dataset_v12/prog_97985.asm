; DESCRIPTION: Places a cyan line segment connecting (225, 214) to (426, 85).
; PLAN: r0=225(x1), r1=214(y1), r2=426(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 214
LDI r2, 426
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
