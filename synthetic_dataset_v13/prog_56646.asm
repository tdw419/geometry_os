; DESCRIPTION: Places a purple 86x91 rectangle at position (421, 10).
; PLAN: r0=421(x), r1=10(y), r2=86(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 10
LDI r2, 86
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
