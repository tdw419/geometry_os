; DESCRIPTION: Places a magenta 24x43 rectangle at position (176, 165).
; PLAN: r0=176(x), r1=165(y), r2=24(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 165
LDI r2, 24
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
