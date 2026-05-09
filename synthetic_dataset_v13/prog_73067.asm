; DESCRIPTION: Renders a white line between points (76, 20) and (56, 117).
; PLAN: r0=76(x1), r1=20(y1), r2=56(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 20
LDI r2, 56
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
