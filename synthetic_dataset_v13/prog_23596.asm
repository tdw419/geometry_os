; DESCRIPTION: Creates a white circular shape at (392, 116) with radius 70.
; PLAN: r0=392(x), r1=116(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 116
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
