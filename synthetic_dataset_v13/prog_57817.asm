; DESCRIPTION: Places a blue 100x71 rectangle at position (320, 3).
; PLAN: r0=320(x), r1=3(y), r2=100(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 3
LDI r2, 100
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
