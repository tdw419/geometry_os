; DESCRIPTION: Places a cyan line segment connecting (446, 1) to (451, 74).
; PLAN: r0=446(x1), r1=1(y1), r2=451(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 1
LDI r2, 451
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
