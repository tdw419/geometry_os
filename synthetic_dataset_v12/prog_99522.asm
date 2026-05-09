; DESCRIPTION: Creates a black rectangular region at (42, 85) spanning 103 by 34 pixels.
; PLAN: r0=42(x), r1=85(y), r2=103(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 85
LDI r2, 103
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
