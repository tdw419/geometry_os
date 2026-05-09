; DESCRIPTION: Places a orange 66x111 rectangle at position (113, 122).
; PLAN: r0=113(x), r1=122(y), r2=66(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 122
LDI r2, 66
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
