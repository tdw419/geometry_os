; DESCRIPTION: Places a orange 28x78 rectangle at position (113, 166).
; PLAN: r0=113(x), r1=166(y), r2=28(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 166
LDI r2, 28
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
