; DESCRIPTION: Draws a orange line from (425, 53) to (168, 38).
; PLAN: r0=425(x1), r1=53(y1), r2=168(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 53
LDI r2, 168
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
