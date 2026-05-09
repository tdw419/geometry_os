; DESCRIPTION: Creates a blue rectangular region at (159, 1) spanning 16 by 114 pixels.
; PLAN: r0=159(x), r1=1(y), r2=16(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 1
LDI r2, 16
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
