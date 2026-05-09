; DESCRIPTION: Places a black 13x27 rectangle at position (59, 63).
; PLAN: r0=59(x), r1=63(y), r2=13(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 63
LDI r2, 13
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
