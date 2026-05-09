; DESCRIPTION: Places a magenta 34x113 rectangle at position (407, 24).
; PLAN: r0=407(x), r1=24(y), r2=34(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 24
LDI r2, 34
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
