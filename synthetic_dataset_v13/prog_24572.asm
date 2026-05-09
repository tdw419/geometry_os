; DESCRIPTION: Creates a blue rectangular region at (128, 71) spanning 83 by 58 pixels.
; PLAN: r0=128(x), r1=71(y), r2=83(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 71
LDI r2, 83
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
