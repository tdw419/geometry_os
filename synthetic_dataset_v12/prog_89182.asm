; DESCRIPTION: Creates a black rectangular region at (93, 176) spanning 86 by 47 pixels.
; PLAN: r0=93(x), r1=176(y), r2=86(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 176
LDI r2, 86
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
