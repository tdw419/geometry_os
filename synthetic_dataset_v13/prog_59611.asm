; DESCRIPTION: Places a white 12x15 rectangle at position (18, 134).
; PLAN: r0=18(x), r1=134(y), r2=12(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 134
LDI r2, 12
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
