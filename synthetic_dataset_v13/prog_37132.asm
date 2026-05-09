; DESCRIPTION: Places a red 12x88 rectangle at position (209, 6).
; PLAN: r0=209(x), r1=6(y), r2=12(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 6
LDI r2, 12
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
