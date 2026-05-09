; DESCRIPTION: Places a white circle of radius 27 at center (152, 219).
; PLAN: r0=152(x), r1=219(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 219
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
