; DESCRIPTION: Creates a green rectangular region at (377, 28) spanning 101 by 103 pixels.
; PLAN: r0=377(x), r1=28(y), r2=101(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 28
LDI r2, 101
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
