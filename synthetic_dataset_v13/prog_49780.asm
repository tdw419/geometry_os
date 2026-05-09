; DESCRIPTION: Creates a green rectangular region at (196, 5) spanning 35 by 113 pixels.
; PLAN: r0=196(x), r1=5(y), r2=35(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 5
LDI r2, 35
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
