; DESCRIPTION: Places a magenta 17x59 rectangle at position (32, 37).
; PLAN: r0=32(x), r1=37(y), r2=17(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 37
LDI r2, 17
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
