; DESCRIPTION: Creates a green rectangular region at (29, 126) spanning 114 by 86 pixels.
; PLAN: r0=29(x), r1=126(y), r2=114(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 126
LDI r2, 114
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
