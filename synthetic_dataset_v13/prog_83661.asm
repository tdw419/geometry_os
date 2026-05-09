; DESCRIPTION: Creates a purple rectangular region at (376, 24) spanning 42 by 50 pixels.
; PLAN: r0=376(x), r1=24(y), r2=42(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 24
LDI r2, 42
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
