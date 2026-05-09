; DESCRIPTION: Places a green line segment connecting (415, 133) to (156, 203).
; PLAN: r0=415(x1), r1=133(y1), r2=156(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 133
LDI r2, 156
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
