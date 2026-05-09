; DESCRIPTION: Places a magenta 103x49 rectangle at position (254, 108).
; PLAN: r0=254(x), r1=108(y), r2=103(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 108
LDI r2, 103
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
