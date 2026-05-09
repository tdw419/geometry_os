; DESCRIPTION: Creates a black rectangular region at (64, 32) spanning 19 by 51 pixels.
; PLAN: r0=64(x), r1=32(y), r2=19(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 32
LDI r2, 19
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
