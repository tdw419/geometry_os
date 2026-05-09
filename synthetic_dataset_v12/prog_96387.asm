; DESCRIPTION: Creates a black rectangular region at (42, 75) spanning 57 by 113 pixels.
; PLAN: r0=42(x), r1=75(y), r2=57(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 75
LDI r2, 57
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
