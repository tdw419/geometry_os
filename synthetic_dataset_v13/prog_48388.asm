; DESCRIPTION: Places a magenta 13x16 rectangle at position (47, 9).
; PLAN: r0=47(x), r1=9(y), r2=13(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 9
LDI r2, 13
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
