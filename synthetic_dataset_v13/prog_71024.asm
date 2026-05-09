; DESCRIPTION: Creates a white rectangular region at (183, 30) spanning 103 by 83 pixels.
; PLAN: r0=183(x), r1=30(y), r2=103(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 30
LDI r2, 103
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
