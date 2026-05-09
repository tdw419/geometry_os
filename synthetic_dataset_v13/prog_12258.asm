; DESCRIPTION: Places a magenta 112x107 rectangle at position (263, 11).
; PLAN: r0=263(x), r1=11(y), r2=112(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 11
LDI r2, 112
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
