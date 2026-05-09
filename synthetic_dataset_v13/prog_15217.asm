; DESCRIPTION: Creates a green rectangular region at (267, 219) spanning 15 by 27 pixels.
; PLAN: r0=267(x), r1=219(y), r2=15(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 219
LDI r2, 15
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
