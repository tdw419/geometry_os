; DESCRIPTION: Creates a white rectangular region at (3, 152) spanning 18 by 69 pixels.
; PLAN: r0=3(x), r1=152(y), r2=18(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 152
LDI r2, 18
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
