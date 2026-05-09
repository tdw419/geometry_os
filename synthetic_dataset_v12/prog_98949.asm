; DESCRIPTION: Creates a orange circular shape at (143, 133) with radius 70.
; PLAN: r0=143(x), r1=133(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 133
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
