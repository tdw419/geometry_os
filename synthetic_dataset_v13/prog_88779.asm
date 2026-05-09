; DESCRIPTION: Places a magenta 94x56 rectangle at position (175, 38).
; PLAN: r0=175(x), r1=38(y), r2=94(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 38
LDI r2, 94
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
