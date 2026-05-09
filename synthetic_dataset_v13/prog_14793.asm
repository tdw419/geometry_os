; DESCRIPTION: Creates a blue rectangular region at (312, 50) spanning 101 by 113 pixels.
; PLAN: r0=312(x), r1=50(y), r2=101(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 50
LDI r2, 101
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
