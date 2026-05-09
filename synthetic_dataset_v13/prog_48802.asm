; DESCRIPTION: Creates a white rectangular region at (215, 134) spanning 85 by 97 pixels.
; PLAN: r0=215(x), r1=134(y), r2=85(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 134
LDI r2, 85
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
