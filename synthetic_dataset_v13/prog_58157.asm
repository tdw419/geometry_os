; DESCRIPTION: Places a magenta 48x74 rectangle at position (203, 15).
; PLAN: r0=203(x), r1=15(y), r2=48(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 15
LDI r2, 48
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
