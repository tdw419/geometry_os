; DESCRIPTION: Creates a white rectangular region at (461, 194) spanning 50 by 15 pixels.
; PLAN: r0=461(x), r1=194(y), r2=50(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 194
LDI r2, 50
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
