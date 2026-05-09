; DESCRIPTION: Places a green line segment connecting (195, 199) to (135, 91).
; PLAN: r0=195(x1), r1=199(y1), r2=135(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 199
LDI r2, 135
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
