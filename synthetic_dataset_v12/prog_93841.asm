; DESCRIPTION: Creates a black rectangular region at (28, 32) spanning 101 by 10 pixels.
; PLAN: r0=28(x), r1=32(y), r2=101(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 32
LDI r2, 101
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
