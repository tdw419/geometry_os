; DESCRIPTION: Places a white 59x96 rectangle at position (35, 155).
; PLAN: r0=35(x), r1=155(y), r2=59(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 155
LDI r2, 59
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
