; DESCRIPTION: Creates a blue rectangular region at (157, 42) spanning 44 by 62 pixels.
; PLAN: r0=157(x), r1=42(y), r2=44(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 42
LDI r2, 44
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
