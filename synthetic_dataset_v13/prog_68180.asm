; DESCRIPTION: Creates a white rectangular region at (338, 95) spanning 10 by 42 pixels.
; PLAN: r0=338(x), r1=95(y), r2=10(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 95
LDI r2, 10
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
