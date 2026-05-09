; DESCRIPTION: Places a white 28x10 rectangle at position (291, 22).
; PLAN: r0=291(x), r1=22(y), r2=28(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 22
LDI r2, 28
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
