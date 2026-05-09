; DESCRIPTION: Creates a black rectangular region at (176, 140) spanning 72 by 73 pixels.
; PLAN: r0=176(x), r1=140(y), r2=72(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 140
LDI r2, 72
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
