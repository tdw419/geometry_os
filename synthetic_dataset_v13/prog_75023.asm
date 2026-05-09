; DESCRIPTION: Renders a white line between points (474, 246) and (480, 203).
; PLAN: r0=474(x1), r1=246(y1), r2=480(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 246
LDI r2, 480
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
