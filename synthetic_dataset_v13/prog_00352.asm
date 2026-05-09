; DESCRIPTION: Places a green line segment connecting (265, 195) to (450, 163).
; PLAN: r0=265(x1), r1=195(y1), r2=450(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 195
LDI r2, 450
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
