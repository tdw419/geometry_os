; DESCRIPTION: Places a yellow 112x10 rectangle at position (257, 35).
; PLAN: r0=257(x), r1=35(y), r2=112(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 35
LDI r2, 112
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
