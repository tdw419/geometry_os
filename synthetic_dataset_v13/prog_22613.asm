; DESCRIPTION: Creates a blue rectangular region at (296, 96) spanning 49 by 93 pixels.
; PLAN: r0=296(x), r1=96(y), r2=49(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 96
LDI r2, 49
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
