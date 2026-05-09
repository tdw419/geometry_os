; DESCRIPTION: Places a green line segment connecting (203, 99) to (289, 177).
; PLAN: r0=203(x1), r1=99(y1), r2=289(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 99
LDI r2, 289
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
