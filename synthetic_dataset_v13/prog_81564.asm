; DESCRIPTION: Places a cyan line segment connecting (26, 160) to (202, 110).
; PLAN: r0=26(x1), r1=160(y1), r2=202(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 160
LDI r2, 202
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
