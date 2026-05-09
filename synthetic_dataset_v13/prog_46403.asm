; DESCRIPTION: Places a purple 13x27 rectangle at position (86, 156).
; PLAN: r0=86(x), r1=156(y), r2=13(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 156
LDI r2, 13
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
