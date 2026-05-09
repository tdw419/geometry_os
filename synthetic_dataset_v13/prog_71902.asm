; DESCRIPTION: Places a white 76x71 rectangle at position (291, 181).
; PLAN: r0=291(x), r1=181(y), r2=76(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 181
LDI r2, 76
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
