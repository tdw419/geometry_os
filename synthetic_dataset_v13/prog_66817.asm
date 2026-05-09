; DESCRIPTION: Places a white line segment connecting (334, 171) to (298, 134).
; PLAN: r0=334(x1), r1=171(y1), r2=298(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 171
LDI r2, 298
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
