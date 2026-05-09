; DESCRIPTION: Creates a blue rectangular region at (64, 41) spanning 82 by 94 pixels.
; PLAN: r0=64(x), r1=41(y), r2=82(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 41
LDI r2, 82
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
