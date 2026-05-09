; DESCRIPTION: Places a magenta 100x15 rectangle at position (340, 218).
; PLAN: r0=340(x), r1=218(y), r2=100(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 218
LDI r2, 100
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
