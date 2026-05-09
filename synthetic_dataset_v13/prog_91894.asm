; DESCRIPTION: Places a magenta 17x74 rectangle at position (268, 75).
; PLAN: r0=268(x), r1=75(y), r2=17(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 75
LDI r2, 17
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
