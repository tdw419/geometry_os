; DESCRIPTION: Creates a blue rectangular region at (43, 117) spanning 31 by 32 pixels.
; PLAN: r0=43(x), r1=117(y), r2=31(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 117
LDI r2, 31
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
