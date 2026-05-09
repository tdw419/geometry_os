; DESCRIPTION: Places a white 93x103 rectangle at position (86, 28).
; PLAN: r0=86(x), r1=28(y), r2=93(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 28
LDI r2, 93
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
