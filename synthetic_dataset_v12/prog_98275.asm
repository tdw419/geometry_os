; DESCRIPTION: Places a yellow 76x88 rectangle at position (200, 59).
; PLAN: r0=200(x), r1=59(y), r2=76(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 59
LDI r2, 76
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
