; DESCRIPTION: Places a black 29x106 rectangle at position (154, 122).
; PLAN: r0=154(x), r1=122(y), r2=29(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 122
LDI r2, 29
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
