; DESCRIPTION: Creates a white rectangular region at (312, 214) spanning 33 by 35 pixels.
; PLAN: r0=312(x), r1=214(y), r2=33(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 214
LDI r2, 33
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
