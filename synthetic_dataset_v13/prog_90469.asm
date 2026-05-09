; DESCRIPTION: Places a magenta 30x18 rectangle at position (185, 172).
; PLAN: r0=185(x), r1=172(y), r2=30(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 172
LDI r2, 30
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
