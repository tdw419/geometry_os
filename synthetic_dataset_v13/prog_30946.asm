; DESCRIPTION: Places a magenta 19x60 rectangle at position (309, 83).
; PLAN: r0=309(x), r1=83(y), r2=19(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 83
LDI r2, 19
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
