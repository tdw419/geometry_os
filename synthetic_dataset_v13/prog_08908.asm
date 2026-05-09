; DESCRIPTION: Places a yellow 75x88 rectangle at position (150, 15).
; PLAN: r0=150(x), r1=15(y), r2=75(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 15
LDI r2, 75
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
