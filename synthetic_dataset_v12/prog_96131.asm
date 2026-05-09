; DESCRIPTION: Places a red 59x29 rectangle at position (90, 108).
; PLAN: r0=90(x), r1=108(y), r2=59(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 108
LDI r2, 59
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
