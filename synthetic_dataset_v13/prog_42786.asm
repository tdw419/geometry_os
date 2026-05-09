; DESCRIPTION: Places a white 15x48 rectangle at position (421, 69).
; PLAN: r0=421(x), r1=69(y), r2=15(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 69
LDI r2, 15
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
