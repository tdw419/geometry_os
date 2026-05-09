; DESCRIPTION: Draws a orange line from (460, 223) to (496, 139).
; PLAN: r0=460(x1), r1=223(y1), r2=496(x2), r3=139(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 223
LDI r2, 496
LDI r3, 139
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
