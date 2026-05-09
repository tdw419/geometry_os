; DESCRIPTION: Places a white 76x15 rectangle at position (10, 175).
; PLAN: r0=10(x), r1=175(y), r2=76(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 175
LDI r2, 76
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
