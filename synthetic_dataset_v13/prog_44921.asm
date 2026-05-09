; DESCRIPTION: Places a cyan line segment connecting (333, 52) to (451, 16).
; PLAN: r0=333(x1), r1=52(y1), r2=451(x2), r3=16(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 52
LDI r2, 451
LDI r3, 16
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
