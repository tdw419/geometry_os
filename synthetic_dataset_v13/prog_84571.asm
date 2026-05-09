; DESCRIPTION: Creates a blue rectangular region at (272, 157) spanning 53 by 61 pixels.
; PLAN: r0=272(x), r1=157(y), r2=53(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 157
LDI r2, 53
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
