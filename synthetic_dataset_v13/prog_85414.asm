; DESCRIPTION: Creates a black rectangular region at (262, 126) spanning 81 by 107 pixels.
; PLAN: r0=262(x), r1=126(y), r2=81(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 126
LDI r2, 81
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
