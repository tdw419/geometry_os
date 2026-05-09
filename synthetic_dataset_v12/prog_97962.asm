; DESCRIPTION: Places a blue 21x27 rectangle at position (257, 223).
; PLAN: r0=257(x), r1=223(y), r2=21(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 223
LDI r2, 21
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
