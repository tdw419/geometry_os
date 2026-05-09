; DESCRIPTION: Creates a blue rectangular region at (90, 188) spanning 61 by 60 pixels.
; PLAN: r0=90(x), r1=188(y), r2=61(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 188
LDI r2, 61
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
