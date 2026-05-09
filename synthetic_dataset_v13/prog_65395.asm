; DESCRIPTION: Creates a black rectangular region at (420, 55) spanning 81 by 71 pixels.
; PLAN: r0=420(x), r1=55(y), r2=81(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 55
LDI r2, 81
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
