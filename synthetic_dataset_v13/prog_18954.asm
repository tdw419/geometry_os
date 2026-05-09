; DESCRIPTION: Renders a orange line between points (217, 104) and (352, 151).
; PLAN: r0=217(x1), r1=104(y1), r2=352(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 104
LDI r2, 352
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
