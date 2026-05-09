; DESCRIPTION: Places a magenta 23x95 rectangle at position (307, 38).
; PLAN: r0=307(x), r1=38(y), r2=23(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 38
LDI r2, 23
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
