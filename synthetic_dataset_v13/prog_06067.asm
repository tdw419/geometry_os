; DESCRIPTION: Places a cyan line segment connecting (78, 127) to (499, 123).
; PLAN: r0=78(x1), r1=127(y1), r2=499(x2), r3=123(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 127
LDI r2, 499
LDI r3, 123
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
