; DESCRIPTION: Places a green line segment connecting (166, 135) to (307, 203).
; PLAN: r0=166(x1), r1=135(y1), r2=307(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 135
LDI r2, 307
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
