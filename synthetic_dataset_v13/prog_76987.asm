; DESCRIPTION: Places a magenta 69x46 rectangle at position (220, 109).
; PLAN: r0=220(x), r1=109(y), r2=69(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 109
LDI r2, 69
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
