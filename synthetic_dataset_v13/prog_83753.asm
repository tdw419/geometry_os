; DESCRIPTION: Places a magenta 99x15 rectangle at position (131, 236).
; PLAN: r0=131(x), r1=236(y), r2=99(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 236
LDI r2, 99
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
