; DESCRIPTION: Renders a white line between points (171, 252) and (203, 5).
; PLAN: r0=171(x1), r1=252(y1), r2=203(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 252
LDI r2, 203
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
