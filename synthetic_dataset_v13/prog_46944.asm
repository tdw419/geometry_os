; DESCRIPTION: Places a cyan line segment connecting (501, 121) to (151, 125).
; PLAN: r0=501(x1), r1=121(y1), r2=151(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 121
LDI r2, 151
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
