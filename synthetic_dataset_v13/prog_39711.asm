; DESCRIPTION: Creates a blue rectangular region at (420, 159) spanning 37 by 38 pixels.
; PLAN: r0=420(x), r1=159(y), r2=37(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 159
LDI r2, 37
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
