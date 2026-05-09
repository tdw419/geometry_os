; DESCRIPTION: Places a orange 63x90 rectangle at position (265, 148).
; PLAN: r0=265(x), r1=148(y), r2=63(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 148
LDI r2, 63
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
