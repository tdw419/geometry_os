; DESCRIPTION: Draws a white line from (44, 83) to (460, 203).
; PLAN: r0=44(x1), r1=83(y1), r2=460(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 83
LDI r2, 460
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
