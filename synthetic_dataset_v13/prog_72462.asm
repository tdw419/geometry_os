; DESCRIPTION: Creates a orange circular shape at (290, 132) with radius 67.
; PLAN: r0=290(x), r1=132(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 132
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
