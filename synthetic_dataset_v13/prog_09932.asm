; DESCRIPTION: Creates a white rectangular region at (355, 42) spanning 41 by 23 pixels.
; PLAN: r0=355(x), r1=42(y), r2=41(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 42
LDI r2, 41
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
