; DESCRIPTION: Creates a black rectangular region at (178, 42) spanning 29 by 82 pixels.
; PLAN: r0=178(x), r1=42(y), r2=29(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 42
LDI r2, 29
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
