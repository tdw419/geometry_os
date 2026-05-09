; DESCRIPTION: Creates a blue rectangular region at (163, 98) spanning 65 by 24 pixels.
; PLAN: r0=163(x), r1=98(y), r2=65(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 98
LDI r2, 65
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
