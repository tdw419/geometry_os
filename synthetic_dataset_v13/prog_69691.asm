; DESCRIPTION: Places a cyan line segment connecting (313, 178) to (62, 127).
; PLAN: r0=313(x1), r1=178(y1), r2=62(x2), r3=127(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 178
LDI r2, 62
LDI r3, 127
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
