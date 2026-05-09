; DESCRIPTION: Places a green line segment connecting (446, 30) to (234, 203).
; PLAN: r0=446(x1), r1=30(y1), r2=234(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 30
LDI r2, 234
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
