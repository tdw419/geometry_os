; DESCRIPTION: Places a blue 21x39 rectangle at position (249, 64).
; PLAN: r0=249(x), r1=64(y), r2=21(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 64
LDI r2, 21
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
