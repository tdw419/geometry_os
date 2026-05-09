; DESCRIPTION: Creates a black rectangular region at (80, 14) spanning 113 by 114 pixels.
; PLAN: r0=80(x), r1=14(y), r2=113(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 14
LDI r2, 113
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
