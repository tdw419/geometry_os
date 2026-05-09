; DESCRIPTION: Creates a green rectangular region at (166, 27) spanning 81 by 84 pixels.
; PLAN: r0=166(x), r1=27(y), r2=81(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 27
LDI r2, 81
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
