; DESCRIPTION: Places a white line segment connecting (122, 161) to (282, 134).
; PLAN: r0=122(x1), r1=161(y1), r2=282(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 161
LDI r2, 282
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
