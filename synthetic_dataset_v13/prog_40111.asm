; DESCRIPTION: Places a magenta 29x52 rectangle at position (469, 37).
; PLAN: r0=469(x), r1=37(y), r2=29(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 37
LDI r2, 29
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
