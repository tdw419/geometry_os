; DESCRIPTION: Draws a orange line from (53, 225) to (386, 68).
; PLAN: r0=53(x1), r1=225(y1), r2=386(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 225
LDI r2, 386
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
