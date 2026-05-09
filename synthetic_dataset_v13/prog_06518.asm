; DESCRIPTION: Creates a orange circular shape at (209, 107) with radius 46.
; PLAN: r0=209(x), r1=107(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 107
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
