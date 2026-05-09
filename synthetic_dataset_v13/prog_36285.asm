; DESCRIPTION: Renders a white line between points (66, 246) and (340, 5).
; PLAN: r0=66(x1), r1=246(y1), r2=340(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 246
LDI r2, 340
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
