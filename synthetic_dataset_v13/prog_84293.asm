; DESCRIPTION: Places a magenta 16x39 rectangle at position (186, 61).
; PLAN: r0=186(x), r1=61(y), r2=16(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 61
LDI r2, 16
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
