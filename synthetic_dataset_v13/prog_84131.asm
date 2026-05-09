; DESCRIPTION: Places a magenta 93x36 rectangle at position (280, 129).
; PLAN: r0=280(x), r1=129(y), r2=93(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 129
LDI r2, 93
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
