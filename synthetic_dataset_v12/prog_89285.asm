; DESCRIPTION: Places a magenta 47x98 rectangle at position (419, 32).
; PLAN: r0=419(x), r1=32(y), r2=47(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 32
LDI r2, 47
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
