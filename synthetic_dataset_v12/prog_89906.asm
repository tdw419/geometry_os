; DESCRIPTION: Places a yellow 60x10 rectangle at position (421, 126).
; PLAN: r0=421(x), r1=126(y), r2=60(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 126
LDI r2, 60
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
