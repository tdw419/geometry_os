; DESCRIPTION: Places a magenta 24x70 rectangle at position (424, 43).
; PLAN: r0=424(x), r1=43(y), r2=24(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 43
LDI r2, 24
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
