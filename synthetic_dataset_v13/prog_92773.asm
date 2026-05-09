; DESCRIPTION: Places a white line segment connecting (130, 7) to (182, 107).
; PLAN: r0=130(x1), r1=7(y1), r2=182(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 7
LDI r2, 182
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
