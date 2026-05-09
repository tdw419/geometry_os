; DESCRIPTION: Places a magenta 56x14 rectangle at position (271, 39).
; PLAN: r0=271(x), r1=39(y), r2=56(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 39
LDI r2, 56
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
