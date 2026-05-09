; DESCRIPTION: Creates a orange circular shape at (127, 151) with radius 65.
; PLAN: r0=127(x), r1=151(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 151
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
