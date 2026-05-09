; DESCRIPTION: Creates a purple rectangular region at (21, 100) spanning 100 by 42 pixels.
; PLAN: r0=21(x), r1=100(y), r2=100(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 100
LDI r2, 100
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
