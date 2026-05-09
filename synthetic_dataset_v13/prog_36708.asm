; DESCRIPTION: Places a red 59x19 rectangle at position (318, 133).
; PLAN: r0=318(x), r1=133(y), r2=59(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 133
LDI r2, 59
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
