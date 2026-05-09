; DESCRIPTION: Creates a red rectangular region at (373, 115) spanning 115 by 42 pixels.
; PLAN: r0=373(x), r1=115(y), r2=115(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 115
LDI r2, 115
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
