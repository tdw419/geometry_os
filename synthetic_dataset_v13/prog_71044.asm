; DESCRIPTION: Creates a black rectangular region at (121, 42) spanning 92 by 19 pixels.
; PLAN: r0=121(x), r1=42(y), r2=92(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 42
LDI r2, 92
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
