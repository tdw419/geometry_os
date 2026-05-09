; DESCRIPTION: Creates a blue rectangular region at (3, 128) spanning 90 by 68 pixels.
; PLAN: r0=3(x), r1=128(y), r2=90(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 128
LDI r2, 90
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
