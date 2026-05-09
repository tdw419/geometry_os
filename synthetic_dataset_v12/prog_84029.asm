; DESCRIPTION: Renders a white line between points (350, 62) and (122, 117).
; PLAN: r0=350(x1), r1=62(y1), r2=122(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 62
LDI r2, 122
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
