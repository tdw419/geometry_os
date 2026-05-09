; DESCRIPTION: Creates a purple rectangular region at (391, 72) spanning 42 by 88 pixels.
; PLAN: r0=391(x), r1=72(y), r2=42(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 72
LDI r2, 42
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
