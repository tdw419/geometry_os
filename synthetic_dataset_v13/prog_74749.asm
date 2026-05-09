; DESCRIPTION: Creates a black rectangular region at (56, 29) spanning 81 by 16 pixels.
; PLAN: r0=56(x), r1=29(y), r2=81(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 29
LDI r2, 81
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
