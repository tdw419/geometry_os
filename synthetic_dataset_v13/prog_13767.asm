; DESCRIPTION: Places a green 87x48 rectangle at position (421, 142).
; PLAN: r0=421(x), r1=142(y), r2=87(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 142
LDI r2, 87
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
