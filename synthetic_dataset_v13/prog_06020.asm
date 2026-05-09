; DESCRIPTION: Creates a white rectangular region at (130, 69) spanning 36 by 18 pixels.
; PLAN: r0=130(x), r1=69(y), r2=36(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 69
LDI r2, 36
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
