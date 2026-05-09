; DESCRIPTION: Creates a white rectangular region at (0, 32) spanning 42 by 11 pixels.
; PLAN: r0=0(x), r1=32(y), r2=42(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 32
LDI r2, 42
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
