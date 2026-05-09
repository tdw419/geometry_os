; DESCRIPTION: Creates a purple rectangular region at (374, 42) spanning 76 by 26 pixels.
; PLAN: r0=374(x), r1=42(y), r2=76(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 42
LDI r2, 76
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
