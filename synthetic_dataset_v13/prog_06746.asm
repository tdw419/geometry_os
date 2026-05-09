; DESCRIPTION: Places a orange 13x52 rectangle at position (267, 15).
; PLAN: r0=267(x), r1=15(y), r2=13(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 15
LDI r2, 13
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
