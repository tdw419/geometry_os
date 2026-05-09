; DESCRIPTION: Renders a white line between points (459, 225) and (67, 7).
; PLAN: r0=459(x1), r1=225(y1), r2=67(x2), r3=7(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 225
LDI r2, 67
LDI r3, 7
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
