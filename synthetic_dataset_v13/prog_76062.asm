; DESCRIPTION: Places a magenta 22x77 rectangle at position (192, 115).
; PLAN: r0=192(x), r1=115(y), r2=22(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 115
LDI r2, 22
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
