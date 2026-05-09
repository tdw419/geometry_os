; DESCRIPTION: Places a green line segment connecting (469, 34) to (445, 243).
; PLAN: r0=469(x1), r1=34(y1), r2=445(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 34
LDI r2, 445
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
