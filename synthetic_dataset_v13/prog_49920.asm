; DESCRIPTION: Places a magenta 78x56 rectangle at position (91, 173).
; PLAN: r0=91(x), r1=173(y), r2=78(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 173
LDI r2, 78
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
