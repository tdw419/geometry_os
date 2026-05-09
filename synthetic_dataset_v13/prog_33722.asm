; DESCRIPTION: Places a red 73x84 rectangle at position (163, 163).
; PLAN: r0=163(x), r1=163(y), r2=73(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 163
LDI r2, 73
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
