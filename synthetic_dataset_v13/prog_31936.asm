; DESCRIPTION: Creates a purple rectangular region at (111, 42) spanning 99 by 108 pixels.
; PLAN: r0=111(x), r1=42(y), r2=99(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 42
LDI r2, 99
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
