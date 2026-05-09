; DESCRIPTION: Creates a black rectangular region at (382, 148) spanning 44 by 103 pixels.
; PLAN: r0=382(x), r1=148(y), r2=44(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 148
LDI r2, 44
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
