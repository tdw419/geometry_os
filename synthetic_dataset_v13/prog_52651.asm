; DESCRIPTION: Places a orange 60x93 rectangle at position (156, 136).
; PLAN: r0=156(x), r1=136(y), r2=60(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 136
LDI r2, 60
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
