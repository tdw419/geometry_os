; DESCRIPTION: Creates a blue rectangular region at (121, 63) spanning 94 by 71 pixels.
; PLAN: r0=121(x), r1=63(y), r2=94(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 63
LDI r2, 94
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
