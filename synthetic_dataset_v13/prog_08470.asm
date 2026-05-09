; DESCRIPTION: Places a orange 97x28 rectangle at position (265, 171).
; PLAN: r0=265(x), r1=171(y), r2=97(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 171
LDI r2, 97
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
