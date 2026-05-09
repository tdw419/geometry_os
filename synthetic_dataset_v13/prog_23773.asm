; DESCRIPTION: Creates a black rectangular region at (263, 103) spanning 116 by 74 pixels.
; PLAN: r0=263(x), r1=103(y), r2=116(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 103
LDI r2, 116
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
