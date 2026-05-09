; DESCRIPTION: Places a magenta 43x96 rectangle at position (323, 55).
; PLAN: r0=323(x), r1=55(y), r2=43(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 55
LDI r2, 43
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
