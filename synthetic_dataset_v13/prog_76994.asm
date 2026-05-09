; DESCRIPTION: Places a green line segment connecting (156, 151) to (70, 28).
; PLAN: r0=156(x1), r1=151(y1), r2=70(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 151
LDI r2, 70
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
