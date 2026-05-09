; DESCRIPTION: Creates a purple rectangular region at (446, 42) spanning 15 by 35 pixels.
; PLAN: r0=446(x), r1=42(y), r2=15(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 42
LDI r2, 15
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
