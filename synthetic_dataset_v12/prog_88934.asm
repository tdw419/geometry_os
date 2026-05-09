; DESCRIPTION: Renders a white line between points (90, 203) and (281, 156).
; PLAN: r0=90(x1), r1=203(y1), r2=281(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 203
LDI r2, 281
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
