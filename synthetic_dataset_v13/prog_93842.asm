; DESCRIPTION: Places a blue 21x104 rectangle at position (245, 63).
; PLAN: r0=245(x), r1=63(y), r2=21(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 63
LDI r2, 21
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
