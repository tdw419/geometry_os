; DESCRIPTION: Creates a blue rectangular region at (192, 30) spanning 83 by 82 pixels.
; PLAN: r0=192(x), r1=30(y), r2=83(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 30
LDI r2, 83
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
