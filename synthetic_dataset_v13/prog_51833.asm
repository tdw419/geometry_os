; DESCRIPTION: Places a blue 45x61 rectangle at position (245, 20).
; PLAN: r0=245(x), r1=20(y), r2=45(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 20
LDI r2, 45
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
