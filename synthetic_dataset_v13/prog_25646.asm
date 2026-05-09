; DESCRIPTION: Places a cyan line segment connecting (117, 46) to (347, 122).
; PLAN: r0=117(x1), r1=46(y1), r2=347(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 46
LDI r2, 347
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
