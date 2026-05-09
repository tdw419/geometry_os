; DESCRIPTION: Places a magenta 77x90 rectangle at position (160, 122).
; PLAN: r0=160(x), r1=122(y), r2=77(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 122
LDI r2, 77
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
