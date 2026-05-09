; DESCRIPTION: Places a cyan line segment connecting (218, 251) to (160, 33).
; PLAN: r0=218(x1), r1=251(y1), r2=160(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 251
LDI r2, 160
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
