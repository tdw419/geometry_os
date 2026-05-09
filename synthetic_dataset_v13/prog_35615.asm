; DESCRIPTION: Places a white line segment connecting (395, 152) to (261, 39).
; PLAN: r0=395(x1), r1=152(y1), r2=261(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 152
LDI r2, 261
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
