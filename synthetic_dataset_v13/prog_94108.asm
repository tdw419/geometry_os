; DESCRIPTION: Creates a yellow rectangular region at (42, 41) spanning 96 by 49 pixels.
; PLAN: r0=42(x), r1=41(y), r2=96(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 41
LDI r2, 96
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
