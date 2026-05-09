; DESCRIPTION: Places a blue 11x45 rectangle at position (245, 48).
; PLAN: r0=245(x), r1=48(y), r2=11(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 48
LDI r2, 11
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
