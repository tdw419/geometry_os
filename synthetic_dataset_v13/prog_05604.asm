; DESCRIPTION: Renders a white line between points (411, 108) and (182, 203).
; PLAN: r0=411(x1), r1=108(y1), r2=182(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 108
LDI r2, 182
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
