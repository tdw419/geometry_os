; DESCRIPTION: Creates a white rectangular region at (72, 170) spanning 71 by 42 pixels.
; PLAN: r0=72(x), r1=170(y), r2=71(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 170
LDI r2, 71
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
