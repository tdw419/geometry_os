; DESCRIPTION: Renders a red line between points (126, 45) and (203, 40).
; PLAN: r0=126(x1), r1=45(y1), r2=203(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 45
LDI r2, 203
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
