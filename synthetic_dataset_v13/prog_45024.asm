; DESCRIPTION: Places a green 81x112 rectangle at position (354, 92).
; PLAN: r0=354(x), r1=92(y), r2=81(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 92
LDI r2, 81
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
