; DESCRIPTION: Creates a blue rectangular region at (296, 13) spanning 34 by 48 pixels.
; PLAN: r0=296(x), r1=13(y), r2=34(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 13
LDI r2, 34
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
