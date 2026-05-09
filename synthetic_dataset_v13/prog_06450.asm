; DESCRIPTION: Places a white 114x18 rectangle at position (116, 48).
; PLAN: r0=116(x), r1=48(y), r2=114(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 48
LDI r2, 114
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
