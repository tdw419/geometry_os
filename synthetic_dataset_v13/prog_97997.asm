; DESCRIPTION: Creates a white rectangular region at (329, 148) spanning 33 by 49 pixels.
; PLAN: r0=329(x), r1=148(y), r2=33(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 148
LDI r2, 33
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
