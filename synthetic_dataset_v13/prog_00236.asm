; DESCRIPTION: Places a orange circle of radius 59 at center (165, 164).
; PLAN: r0=165(x), r1=164(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 164
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
