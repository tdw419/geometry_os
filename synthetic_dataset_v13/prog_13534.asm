; DESCRIPTION: Places a cyan line segment connecting (234, 160) to (111, 216).
; PLAN: r0=234(x1), r1=160(y1), r2=111(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 160
LDI r2, 111
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
