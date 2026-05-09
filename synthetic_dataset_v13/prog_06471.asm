; DESCRIPTION: Places a magenta 43x100 rectangle at position (269, 18).
; PLAN: r0=269(x), r1=18(y), r2=43(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 18
LDI r2, 43
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
