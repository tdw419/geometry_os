; DESCRIPTION: Creates a black rectangular region at (271, 120) spanning 101 by 28 pixels.
; PLAN: r0=271(x), r1=120(y), r2=101(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 120
LDI r2, 101
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
