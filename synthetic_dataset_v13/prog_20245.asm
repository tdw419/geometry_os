; DESCRIPTION: Creates a white rectangular region at (274, 42) spanning 103 by 73 pixels.
; PLAN: r0=274(x), r1=42(y), r2=103(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 42
LDI r2, 103
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
