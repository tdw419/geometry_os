; DESCRIPTION: Places a magenta 98x16 rectangle at position (229, 163).
; PLAN: r0=229(x), r1=163(y), r2=98(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 163
LDI r2, 98
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
