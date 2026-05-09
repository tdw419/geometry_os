; DESCRIPTION: Places a white 28x100 rectangle at position (122, 108).
; PLAN: r0=122(x), r1=108(y), r2=28(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 108
LDI r2, 28
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
