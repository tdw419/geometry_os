; DESCRIPTION: Creates a blue rectangular region at (156, 97) spanning 85 by 71 pixels.
; PLAN: r0=156(x), r1=97(y), r2=85(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 97
LDI r2, 85
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
