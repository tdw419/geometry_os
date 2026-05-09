; DESCRIPTION: Creates a black rectangular region at (178, 109) spanning 116 by 70 pixels.
; PLAN: r0=178(x), r1=109(y), r2=116(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 109
LDI r2, 116
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
