; DESCRIPTION: Creates a green rectangular region at (209, 81) spanning 14 by 113 pixels.
; PLAN: r0=209(x), r1=81(y), r2=14(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 81
LDI r2, 14
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
