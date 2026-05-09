; DESCRIPTION: Places a red 43x36 rectangle at position (359, 56).
; PLAN: r0=359(x), r1=56(y), r2=43(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 56
LDI r2, 43
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
