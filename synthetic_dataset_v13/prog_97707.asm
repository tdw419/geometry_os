; DESCRIPTION: Creates a black rectangular region at (223, 173) spanning 81 by 46 pixels.
; PLAN: r0=223(x), r1=173(y), r2=81(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 173
LDI r2, 81
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
