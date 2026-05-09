; DESCRIPTION: Places a magenta 102x15 rectangle at position (32, 160).
; PLAN: r0=32(x), r1=160(y), r2=102(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 160
LDI r2, 102
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
