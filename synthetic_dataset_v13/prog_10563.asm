; DESCRIPTION: Places a white 59x29 rectangle at position (53, 175).
; PLAN: r0=53(x), r1=175(y), r2=59(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 175
LDI r2, 59
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
