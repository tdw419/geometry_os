; DESCRIPTION: Creates a blue rectangular region at (87, 19) spanning 58 by 98 pixels.
; PLAN: r0=87(x), r1=19(y), r2=58(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 19
LDI r2, 58
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
