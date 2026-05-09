; DESCRIPTION: Creates a blue rectangular region at (296, 56) spanning 10 by 61 pixels.
; PLAN: r0=296(x), r1=56(y), r2=10(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 56
LDI r2, 10
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
