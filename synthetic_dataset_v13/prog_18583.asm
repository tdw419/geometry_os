; DESCRIPTION: Places a cyan line segment connecting (313, 36) to (199, 222).
; PLAN: r0=313(x1), r1=36(y1), r2=199(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 36
LDI r2, 199
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
