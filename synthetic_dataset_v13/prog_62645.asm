; DESCRIPTION: Places a magenta 39x27 rectangle at position (373, 88).
; PLAN: r0=373(x), r1=88(y), r2=39(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 88
LDI r2, 39
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
