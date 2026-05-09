; DESCRIPTION: Renders a white line between points (353, 91) and (450, 117).
; PLAN: r0=353(x1), r1=91(y1), r2=450(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 91
LDI r2, 450
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
