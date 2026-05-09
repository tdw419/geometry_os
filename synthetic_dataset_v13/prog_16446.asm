; DESCRIPTION: Places a magenta 39x39 rectangle at position (36, 115).
; PLAN: r0=36(x), r1=115(y), r2=39(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 115
LDI r2, 39
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
