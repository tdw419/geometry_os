; DESCRIPTION: Places a white 113x23 rectangle at position (86, 61).
; PLAN: r0=86(x), r1=61(y), r2=113(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 61
LDI r2, 113
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
