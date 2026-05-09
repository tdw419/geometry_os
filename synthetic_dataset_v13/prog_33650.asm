; DESCRIPTION: Places a magenta 31x36 rectangle at position (218, 68).
; PLAN: r0=218(x), r1=68(y), r2=31(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 68
LDI r2, 31
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
