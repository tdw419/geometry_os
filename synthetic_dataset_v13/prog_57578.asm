; DESCRIPTION: Places a green 44x11 rectangle at position (257, 102).
; PLAN: r0=257(x), r1=102(y), r2=44(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 102
LDI r2, 44
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
