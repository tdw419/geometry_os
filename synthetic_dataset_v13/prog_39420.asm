; DESCRIPTION: Places a magenta 24x17 rectangle at position (102, 129).
; PLAN: r0=102(x), r1=129(y), r2=24(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 129
LDI r2, 24
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
