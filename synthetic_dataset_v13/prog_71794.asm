; DESCRIPTION: Creates a purple rectangular region at (346, 42) spanning 10 by 11 pixels.
; PLAN: r0=346(x), r1=42(y), r2=10(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 42
LDI r2, 10
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
