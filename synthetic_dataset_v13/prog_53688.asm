; DESCRIPTION: Creates a white circular shape at (162, 186) with radius 69.
; PLAN: r0=162(x), r1=186(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 186
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
