; DESCRIPTION: Creates a green rectangular region at (100, 6) spanning 101 by 113 pixels.
; PLAN: r0=100(x), r1=6(y), r2=101(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 6
LDI r2, 101
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
