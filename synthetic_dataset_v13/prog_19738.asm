; DESCRIPTION: Places a orange circle of radius 69 at center (304, 146).
; PLAN: r0=304(x), r1=146(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 146
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
