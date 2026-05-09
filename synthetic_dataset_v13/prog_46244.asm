; DESCRIPTION: Creates a black rectangular region at (26, 0) spanning 109 by 107 pixels.
; PLAN: r0=26(x), r1=0(y), r2=109(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 0
LDI r2, 109
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
