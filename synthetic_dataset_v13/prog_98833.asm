; DESCRIPTION: Creates a black rectangular region at (136, 68) spanning 12 by 42 pixels.
; PLAN: r0=136(x), r1=68(y), r2=12(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 68
LDI r2, 12
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
