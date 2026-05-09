; DESCRIPTION: Places a blue 43x52 rectangle at position (148, 6).
; PLAN: r0=148(x), r1=6(y), r2=43(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 6
LDI r2, 43
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
