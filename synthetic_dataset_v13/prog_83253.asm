; DESCRIPTION: Places a white 28x85 rectangle at position (456, 138).
; PLAN: r0=456(x), r1=138(y), r2=28(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 138
LDI r2, 28
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
