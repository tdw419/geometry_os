; DESCRIPTION: Places a magenta 18x55 rectangle at position (469, 18).
; PLAN: r0=469(x), r1=18(y), r2=18(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 18
LDI r2, 18
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
