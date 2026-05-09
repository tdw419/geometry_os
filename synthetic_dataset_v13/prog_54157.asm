; DESCRIPTION: Places a magenta 39x41 rectangle at position (37, 59).
; PLAN: r0=37(x), r1=59(y), r2=39(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 59
LDI r2, 39
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
