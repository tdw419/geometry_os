; DESCRIPTION: Places a magenta 37x17 rectangle at position (138, 115).
; PLAN: r0=138(x), r1=115(y), r2=37(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 115
LDI r2, 37
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
