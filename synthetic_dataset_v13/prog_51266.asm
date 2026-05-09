; DESCRIPTION: Creates a white rectangular region at (68, 107) spanning 101 by 36 pixels.
; PLAN: r0=68(x), r1=107(y), r2=101(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 107
LDI r2, 101
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
