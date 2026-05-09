; DESCRIPTION: Places a white line segment connecting (290, 167) to (275, 15).
; PLAN: r0=290(x1), r1=167(y1), r2=275(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 167
LDI r2, 275
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
