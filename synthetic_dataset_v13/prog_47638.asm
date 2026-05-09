; DESCRIPTION: Places a white line segment connecting (445, 216) to (128, 210).
; PLAN: r0=445(x1), r1=216(y1), r2=128(x2), r3=210(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 216
LDI r2, 128
LDI r3, 210
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
