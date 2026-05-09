; DESCRIPTION: Creates a white circular shape at (295, 122) with radius 70.
; PLAN: r0=295(x), r1=122(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 122
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
