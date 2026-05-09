; DESCRIPTION: Places a purple 76x21 rectangle at position (269, 88).
; PLAN: r0=269(x), r1=88(y), r2=76(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 88
LDI r2, 76
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
