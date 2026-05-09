; DESCRIPTION: Creates a white circular shape at (387, 117) with radius 59.
; PLAN: r0=387(x), r1=117(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 117
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
