; DESCRIPTION: Places a white 55x81 rectangle at position (55, 87).
; PLAN: r0=55(x), r1=87(y), r2=55(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 87
LDI r2, 55
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
