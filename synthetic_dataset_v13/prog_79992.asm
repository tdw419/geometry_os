; DESCRIPTION: Places a orange 36x34 rectangle at position (267, 56).
; PLAN: r0=267(x), r1=56(y), r2=36(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 56
LDI r2, 36
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
