; DESCRIPTION: Places a blue 21x112 rectangle at position (294, 63).
; PLAN: r0=294(x), r1=63(y), r2=21(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 63
LDI r2, 21
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
