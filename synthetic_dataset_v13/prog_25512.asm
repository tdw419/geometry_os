; DESCRIPTION: Places a blue 59x17 rectangle at position (312, 16).
; PLAN: r0=312(x), r1=16(y), r2=59(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 16
LDI r2, 59
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
