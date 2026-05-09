; DESCRIPTION: Places a magenta 107x32 rectangle at position (40, 189).
; PLAN: r0=40(x), r1=189(y), r2=107(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 189
LDI r2, 107
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
