; DESCRIPTION: Creates a blue rectangular region at (244, 90) spanning 82 by 61 pixels.
; PLAN: r0=244(x), r1=90(y), r2=82(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 90
LDI r2, 82
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
