; DESCRIPTION: Places a cyan line segment connecting (445, 216) to (264, 203).
; PLAN: r0=445(x1), r1=216(y1), r2=264(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 216
LDI r2, 264
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
