; DESCRIPTION: Creates a red rectangular region at (62, 17) spanning 29 by 86 pixels.
; PLAN: r0=62(x), r1=17(y), r2=29(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 17
LDI r2, 29
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
