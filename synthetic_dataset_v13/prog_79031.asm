; DESCRIPTION: Places a magenta 52x86 rectangle at position (185, 105).
; PLAN: r0=185(x), r1=105(y), r2=52(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 105
LDI r2, 52
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
