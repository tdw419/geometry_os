; DESCRIPTION: Renders a orange line between points (238, 100) and (346, 174).
; PLAN: r0=238(x1), r1=100(y1), r2=346(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 100
LDI r2, 346
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
