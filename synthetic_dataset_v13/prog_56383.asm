; DESCRIPTION: Creates a blue rectangular region at (85, 157) spanning 71 by 27 pixels.
; PLAN: r0=85(x), r1=157(y), r2=71(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 157
LDI r2, 71
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
