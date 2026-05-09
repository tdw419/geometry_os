; DESCRIPTION: Creates a orange circular shape at (187, 125) with radius 27.
; PLAN: r0=187(x), r1=125(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 125
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
