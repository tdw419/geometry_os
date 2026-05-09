; DESCRIPTION: Places a white 114x18 rectangle at position (238, 228).
; PLAN: r0=238(x), r1=228(y), r2=114(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 228
LDI r2, 114
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
