; DESCRIPTION: Creates a white rectangular region at (199, 37) spanning 69 by 47 pixels.
; PLAN: r0=199(x), r1=37(y), r2=69(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 37
LDI r2, 69
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
