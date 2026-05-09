; DESCRIPTION: Places a white line segment connecting (184, 242) to (473, 23).
; PLAN: r0=184(x1), r1=242(y1), r2=473(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 242
LDI r2, 473
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
