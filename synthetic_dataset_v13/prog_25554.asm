; DESCRIPTION: Creates a white rectangular region at (172, 7) spanning 82 by 42 pixels.
; PLAN: r0=172(x), r1=7(y), r2=82(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 7
LDI r2, 82
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
