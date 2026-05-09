; DESCRIPTION: Places a orange 68x96 rectangle at position (354, 134).
; PLAN: r0=354(x), r1=134(y), r2=68(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 134
LDI r2, 68
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
