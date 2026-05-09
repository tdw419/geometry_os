; DESCRIPTION: Places a black 64x96 rectangle at position (416, 28).
; PLAN: r0=416(x), r1=28(y), r2=64(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 28
LDI r2, 64
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
