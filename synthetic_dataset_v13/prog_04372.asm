; DESCRIPTION: Places a white 59x61 rectangle at position (30, 56).
; PLAN: r0=30(x), r1=56(y), r2=59(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 56
LDI r2, 59
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
