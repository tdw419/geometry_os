; DESCRIPTION: Places a red 37x46 rectangle at position (84, 88).
; PLAN: r0=84(x), r1=88(y), r2=37(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 88
LDI r2, 37
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
