; DESCRIPTION: Places a white line segment connecting (186, 239) to (78, 124).
; PLAN: r0=186(x1), r1=239(y1), r2=78(x2), r3=124(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 239
LDI r2, 78
LDI r3, 124
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
