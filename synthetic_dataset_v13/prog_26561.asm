; DESCRIPTION: Places a white line segment connecting (445, 31) to (329, 204).
; PLAN: r0=445(x1), r1=31(y1), r2=329(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 31
LDI r2, 329
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
