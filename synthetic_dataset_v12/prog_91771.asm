; DESCRIPTION: Places a magenta 19x102 rectangle at position (400, 135).
; PLAN: r0=400(x), r1=135(y), r2=19(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 135
LDI r2, 19
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
