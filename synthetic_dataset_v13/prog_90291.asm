; DESCRIPTION: Creates a white rectangular region at (380, 35) spanning 42 by 24 pixels.
; PLAN: r0=380(x), r1=35(y), r2=42(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 35
LDI r2, 42
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
