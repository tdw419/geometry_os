; DESCRIPTION: Creates a white rectangular region at (455, 76) spanning 32 by 41 pixels.
; PLAN: r0=455(x), r1=76(y), r2=32(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 76
LDI r2, 32
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
