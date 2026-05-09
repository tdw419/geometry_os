; DESCRIPTION: Creates a white rectangular region at (397, 215) spanning 65 by 26 pixels.
; PLAN: r0=397(x), r1=215(y), r2=65(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 215
LDI r2, 65
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
