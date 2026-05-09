; DESCRIPTION: Creates a blue rectangular region at (44, 62) spanning 32 by 120 pixels.
; PLAN: r0=44(x), r1=62(y), r2=32(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 62
LDI r2, 32
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
