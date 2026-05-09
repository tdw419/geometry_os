; DESCRIPTION: Places a white line segment connecting (43, 93) to (261, 237).
; PLAN: r0=43(x1), r1=93(y1), r2=261(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 93
LDI r2, 261
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
