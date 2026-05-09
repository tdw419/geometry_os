; DESCRIPTION: Places a magenta 39x104 rectangle at position (345, 17).
; PLAN: r0=345(x), r1=17(y), r2=39(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 17
LDI r2, 39
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
