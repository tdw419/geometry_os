; DESCRIPTION: Places a magenta 69x20 rectangle at position (137, 17).
; PLAN: r0=137(x), r1=17(y), r2=69(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 17
LDI r2, 69
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
