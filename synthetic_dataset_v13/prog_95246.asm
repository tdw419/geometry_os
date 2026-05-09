; DESCRIPTION: Creates a green rectangular region at (338, 27) spanning 75 by 10 pixels.
; PLAN: r0=338(x), r1=27(y), r2=75(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 27
LDI r2, 75
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
