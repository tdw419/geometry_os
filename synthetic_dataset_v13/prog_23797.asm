; DESCRIPTION: Creates a purple rectangular region at (1, 184) spanning 42 by 15 pixels.
; PLAN: r0=1(x), r1=184(y), r2=42(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 184
LDI r2, 42
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
