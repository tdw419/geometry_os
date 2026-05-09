; DESCRIPTION: Places a magenta 33x98 rectangle at position (373, 158).
; PLAN: r0=373(x), r1=158(y), r2=33(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 158
LDI r2, 33
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
