; DESCRIPTION: Creates a black rectangular region at (42, 105) spanning 100 by 12 pixels.
; PLAN: r0=42(x), r1=105(y), r2=100(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 105
LDI r2, 100
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
