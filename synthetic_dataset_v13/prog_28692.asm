; DESCRIPTION: Places a blue 30x77 rectangle at position (245, 24).
; PLAN: r0=245(x), r1=24(y), r2=30(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 24
LDI r2, 30
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
