; DESCRIPTION: Places a magenta 113x26 rectangle at position (385, 90).
; PLAN: r0=385(x), r1=90(y), r2=113(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 90
LDI r2, 113
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
