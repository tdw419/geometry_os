; DESCRIPTION: Places a orange 35x28 rectangle at position (151, 93).
; PLAN: r0=151(x), r1=93(y), r2=35(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 93
LDI r2, 35
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
