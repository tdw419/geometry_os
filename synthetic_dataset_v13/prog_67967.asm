; DESCRIPTION: Creates a black rectangular region at (148, 107) spanning 95 by 43 pixels.
; PLAN: r0=148(x), r1=107(y), r2=95(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 107
LDI r2, 95
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
