; DESCRIPTION: Places a magenta 108x31 rectangle at position (32, 225).
; PLAN: r0=32(x), r1=225(y), r2=108(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 225
LDI r2, 108
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
