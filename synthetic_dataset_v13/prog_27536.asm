; DESCRIPTION: Creates a blue rectangular region at (296, 23) spanning 113 by 68 pixels.
; PLAN: r0=296(x), r1=23(y), r2=113(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 23
LDI r2, 113
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
