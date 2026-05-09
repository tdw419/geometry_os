; DESCRIPTION: Places a green line segment connecting (445, 202) to (60, 188).
; PLAN: r0=445(x1), r1=202(y1), r2=60(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 202
LDI r2, 60
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
