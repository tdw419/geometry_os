; DESCRIPTION: Creates a black rectangular region at (42, 97) spanning 12 by 107 pixels.
; PLAN: r0=42(x), r1=97(y), r2=12(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 97
LDI r2, 12
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
