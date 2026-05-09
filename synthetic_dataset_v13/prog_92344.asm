; DESCRIPTION: Places a green 55x106 rectangle at position (449, 56).
; PLAN: r0=449(x), r1=56(y), r2=55(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 56
LDI r2, 55
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
