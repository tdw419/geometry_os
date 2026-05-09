; DESCRIPTION: Places a orange circle of radius 76 at center (187, 150).
; PLAN: r0=187(x), r1=150(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 150
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
