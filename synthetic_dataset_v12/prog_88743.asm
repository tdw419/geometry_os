; DESCRIPTION: Creates a white rectangular region at (298, 31) spanning 103 by 69 pixels.
; PLAN: r0=298(x), r1=31(y), r2=103(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 31
LDI r2, 103
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
