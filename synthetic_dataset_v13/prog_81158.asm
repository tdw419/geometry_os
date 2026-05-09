; DESCRIPTION: Places a white line segment connecting (398, 41) to (324, 124).
; PLAN: r0=398(x1), r1=41(y1), r2=324(x2), r3=124(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 41
LDI r2, 324
LDI r3, 124
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
