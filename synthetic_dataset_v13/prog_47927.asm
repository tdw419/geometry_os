; DESCRIPTION: Places a white line segment connecting (492, 249) to (501, 244).
; PLAN: r0=492(x1), r1=249(y1), r2=501(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 249
LDI r2, 501
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
