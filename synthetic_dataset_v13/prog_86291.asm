; DESCRIPTION: Creates a white rectangular region at (136, 114) spanning 42 by 101 pixels.
; PLAN: r0=136(x), r1=114(y), r2=42(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 114
LDI r2, 42
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
