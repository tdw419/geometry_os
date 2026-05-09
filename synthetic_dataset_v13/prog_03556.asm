; DESCRIPTION: Places a yellow 116x59 rectangle at position (318, 158).
; PLAN: r0=318(x), r1=158(y), r2=116(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 158
LDI r2, 116
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
