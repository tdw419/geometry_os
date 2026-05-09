; DESCRIPTION: Places a magenta 53x109 rectangle at position (127, 6).
; PLAN: r0=127(x), r1=6(y), r2=53(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 6
LDI r2, 53
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
