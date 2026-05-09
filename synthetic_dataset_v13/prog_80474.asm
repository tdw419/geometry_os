; DESCRIPTION: Creates a black rectangular region at (16, 90) spanning 14 by 72 pixels.
; PLAN: r0=16(x), r1=90(y), r2=14(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 90
LDI r2, 14
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
