; DESCRIPTION: Places a orange 113x23 rectangle at position (29, 156).
; PLAN: r0=29(x), r1=156(y), r2=113(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 156
LDI r2, 113
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
