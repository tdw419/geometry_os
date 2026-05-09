; DESCRIPTION: Places a cyan line segment connecting (148, 109) to (203, 30).
; PLAN: r0=148(x1), r1=109(y1), r2=203(x2), r3=30(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 109
LDI r2, 203
LDI r3, 30
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
