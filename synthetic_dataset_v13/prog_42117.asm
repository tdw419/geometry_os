; DESCRIPTION: Places a orange 81x82 rectangle at position (369, 136).
; PLAN: r0=369(x), r1=136(y), r2=81(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 136
LDI r2, 81
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
