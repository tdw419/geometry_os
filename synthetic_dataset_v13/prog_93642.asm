; DESCRIPTION: Creates a black rectangular region at (42, 188) spanning 53 by 10 pixels.
; PLAN: r0=42(x), r1=188(y), r2=53(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 188
LDI r2, 53
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
