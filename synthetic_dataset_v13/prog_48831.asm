; DESCRIPTION: Places a magenta 60x109 rectangle at position (299, 54).
; PLAN: r0=299(x), r1=54(y), r2=60(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 54
LDI r2, 60
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
