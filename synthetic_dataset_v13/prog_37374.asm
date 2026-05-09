; DESCRIPTION: Places a magenta 115x52 rectangle at position (60, 204).
; PLAN: r0=60(x), r1=204(y), r2=115(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 204
LDI r2, 115
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
