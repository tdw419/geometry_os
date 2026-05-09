; DESCRIPTION: Places a purple 26x59 rectangle at position (435, 191).
; PLAN: r0=435(x), r1=191(y), r2=26(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 191
LDI r2, 26
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
