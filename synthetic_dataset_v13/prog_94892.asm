; DESCRIPTION: Creates a green rectangular region at (6, 10) spanning 37 by 113 pixels.
; PLAN: r0=6(x), r1=10(y), r2=37(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 10
LDI r2, 37
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
