; DESCRIPTION: Creates a orange rectangular region at (157, 115) spanning 61 by 53 pixels.
; PLAN: r0=157(x), r1=115(y), r2=61(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 115
LDI r2, 61
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
