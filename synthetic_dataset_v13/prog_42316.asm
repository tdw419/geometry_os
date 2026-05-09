; DESCRIPTION: Creates a black rectangular region at (107, 69) spanning 95 by 40 pixels.
; PLAN: r0=107(x), r1=69(y), r2=95(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 69
LDI r2, 95
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
