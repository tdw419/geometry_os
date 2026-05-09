; DESCRIPTION: Places a magenta 17x23 rectangle at position (45, 197).
; PLAN: r0=45(x), r1=197(y), r2=17(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 197
LDI r2, 17
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
