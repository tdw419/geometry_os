; DESCRIPTION: Places a white line segment connecting (243, 203) to (246, 94).
; PLAN: r0=243(x1), r1=203(y1), r2=246(x2), r3=94(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 203
LDI r2, 246
LDI r3, 94
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
