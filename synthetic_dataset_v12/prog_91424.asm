; DESCRIPTION: Creates a black rectangular region at (333, 16) spanning 34 by 101 pixels.
; PLAN: r0=333(x), r1=16(y), r2=34(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 16
LDI r2, 34
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
