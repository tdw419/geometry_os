; DESCRIPTION: Places a white 26x102 rectangle at position (372, 78).
; PLAN: r0=372(x), r1=78(y), r2=26(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 78
LDI r2, 26
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
