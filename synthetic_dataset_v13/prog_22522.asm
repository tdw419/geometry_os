; DESCRIPTION: Places a magenta 42x35 rectangle at position (371, 186).
; PLAN: r0=371(x), r1=186(y), r2=42(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 186
LDI r2, 42
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
