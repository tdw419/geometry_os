; DESCRIPTION: Places a orange circle of radius 30 at center (103, 91).
; PLAN: r0=103(x), r1=91(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 91
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
