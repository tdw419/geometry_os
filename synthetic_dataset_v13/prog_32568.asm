; DESCRIPTION: Places a orange 94x63 rectangle at position (209, 114).
; PLAN: r0=209(x), r1=114(y), r2=94(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 114
LDI r2, 94
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
