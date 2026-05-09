; DESCRIPTION: Creates a white rectangular region at (429, 167) spanning 42 by 34 pixels.
; PLAN: r0=429(x), r1=167(y), r2=42(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 167
LDI r2, 42
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
