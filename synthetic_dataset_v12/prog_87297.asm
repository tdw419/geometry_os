; DESCRIPTION: Renders a white box of size 99x81 starting at (58, 59).
; PLAN: r0=58(x), r1=59(y), r2=99(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 59
LDI r2, 99
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
