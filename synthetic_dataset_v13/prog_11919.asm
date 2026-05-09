; DESCRIPTION: Creates a white rectangular region at (101, 102) spanning 70 by 86 pixels.
; PLAN: r0=101(x), r1=102(y), r2=70(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 102
LDI r2, 70
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
