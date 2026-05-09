; DESCRIPTION: Places a white line segment connecting (240, 205) to (130, 76).
; PLAN: r0=240(x1), r1=205(y1), r2=130(x2), r3=76(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 205
LDI r2, 130
LDI r3, 76
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
