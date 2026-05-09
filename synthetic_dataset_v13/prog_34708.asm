; DESCRIPTION: Creates a black rectangular region at (455, 102) spanning 19 by 42 pixels.
; PLAN: r0=455(x), r1=102(y), r2=19(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 102
LDI r2, 19
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
