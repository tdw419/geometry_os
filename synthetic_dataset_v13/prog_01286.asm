; DESCRIPTION: Creates a white rectangular region at (372, 28) spanning 81 by 102 pixels.
; PLAN: r0=372(x), r1=28(y), r2=81(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 28
LDI r2, 81
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
