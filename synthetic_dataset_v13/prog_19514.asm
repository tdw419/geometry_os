; DESCRIPTION: Places a red line segment connecting (203, 33) to (445, 250).
; PLAN: r0=203(x1), r1=33(y1), r2=445(x2), r3=250(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 33
LDI r2, 445
LDI r3, 250
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
