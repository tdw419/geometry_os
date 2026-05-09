; DESCRIPTION: Creates a white rectangular region at (95, 115) spanning 42 by 113 pixels.
; PLAN: r0=95(x), r1=115(y), r2=42(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 115
LDI r2, 42
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
