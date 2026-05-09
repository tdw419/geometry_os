; DESCRIPTION: Places a red 59x58 rectangle at position (287, 37).
; PLAN: r0=287(x), r1=37(y), r2=59(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 37
LDI r2, 59
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
