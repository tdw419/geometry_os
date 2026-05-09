; DESCRIPTION: Creates a blue rectangular region at (371, 82) spanning 78 by 107 pixels.
; PLAN: r0=371(x), r1=82(y), r2=78(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 82
LDI r2, 78
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
