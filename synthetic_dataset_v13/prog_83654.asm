; DESCRIPTION: Creates a blue rectangular region at (309, 101) spanning 86 by 90 pixels.
; PLAN: r0=309(x), r1=101(y), r2=86(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 101
LDI r2, 86
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
