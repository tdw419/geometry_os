; DESCRIPTION: Places a cyan line segment connecting (491, 140) to (127, 80).
; PLAN: r0=491(x1), r1=140(y1), r2=127(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 140
LDI r2, 127
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
