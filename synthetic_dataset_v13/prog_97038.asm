; DESCRIPTION: Places a magenta 24x12 rectangle at position (204, 176).
; PLAN: r0=204(x), r1=176(y), r2=24(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 176
LDI r2, 24
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
