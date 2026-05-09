; DESCRIPTION: Creates a black rectangular region at (375, 111) spanning 42 by 105 pixels.
; PLAN: r0=375(x), r1=111(y), r2=42(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 111
LDI r2, 42
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
