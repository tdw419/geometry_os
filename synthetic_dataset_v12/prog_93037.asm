; DESCRIPTION: Renders a white line between points (75, 203) and (94, 27).
; PLAN: r0=75(x1), r1=203(y1), r2=94(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 203
LDI r2, 94
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
