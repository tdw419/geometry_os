; DESCRIPTION: Creates a white rectangular region at (223, 145) spanning 35 by 19 pixels.
; PLAN: r0=223(x), r1=145(y), r2=35(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 145
LDI r2, 35
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
