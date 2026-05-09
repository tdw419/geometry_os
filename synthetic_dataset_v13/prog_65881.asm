; DESCRIPTION: Places a magenta 95x15 rectangle at position (218, 77).
; PLAN: r0=218(x), r1=77(y), r2=95(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 77
LDI r2, 95
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
