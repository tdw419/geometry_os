; DESCRIPTION: Places a white line segment connecting (209, 160) to (410, 85).
; PLAN: r0=209(x1), r1=160(y1), r2=410(x2), r3=85(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 160
LDI r2, 410
LDI r3, 85
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
