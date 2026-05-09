; DESCRIPTION: Places a white line segment connecting (288, 241) to (298, 68).
; PLAN: r0=288(x1), r1=241(y1), r2=298(x2), r3=68(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 241
LDI r2, 298
LDI r3, 68
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
