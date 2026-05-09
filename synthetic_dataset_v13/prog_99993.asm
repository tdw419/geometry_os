; DESCRIPTION: Places a magenta line segment connecting (406, 239) to (134, 162).
; PLAN: r0=406(x1), r1=239(y1), r2=134(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 239
LDI r2, 134
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
