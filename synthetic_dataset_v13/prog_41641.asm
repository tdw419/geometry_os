; DESCRIPTION: Places a magenta 98x35 rectangle at position (313, 141).
; PLAN: r0=313(x), r1=141(y), r2=98(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 141
LDI r2, 98
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
