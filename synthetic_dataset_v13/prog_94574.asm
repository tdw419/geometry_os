; DESCRIPTION: Creates a blue rectangular region at (411, 11) spanning 24 by 28 pixels.
; PLAN: r0=411(x), r1=11(y), r2=24(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 11
LDI r2, 24
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
