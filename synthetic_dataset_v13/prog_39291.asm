; DESCRIPTION: Places a red 59x18 rectangle at position (30, 23).
; PLAN: r0=30(x), r1=23(y), r2=59(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 23
LDI r2, 59
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
