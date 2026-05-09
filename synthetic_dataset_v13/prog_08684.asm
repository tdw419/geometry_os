; DESCRIPTION: Places a magenta 108x109 rectangle at position (139, 38).
; PLAN: r0=139(x), r1=38(y), r2=108(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 38
LDI r2, 108
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
