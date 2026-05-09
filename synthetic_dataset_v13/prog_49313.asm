; DESCRIPTION: Places a white line segment connecting (405, 242) to (315, 26).
; PLAN: r0=405(x1), r1=242(y1), r2=315(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 242
LDI r2, 315
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
