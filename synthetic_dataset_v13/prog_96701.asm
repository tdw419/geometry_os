; DESCRIPTION: Creates a blue rectangular region at (140, 4) spanning 64 by 41 pixels.
; PLAN: r0=140(x), r1=4(y), r2=64(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 4
LDI r2, 64
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
