; DESCRIPTION: Creates a green rectangular region at (81, 117) spanning 28 by 12 pixels.
; PLAN: r0=81(x), r1=117(y), r2=28(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 117
LDI r2, 28
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
