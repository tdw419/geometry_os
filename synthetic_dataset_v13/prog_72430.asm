; DESCRIPTION: Creates a white rectangular region at (257, 127) spanning 84 by 75 pixels.
; PLAN: r0=257(x), r1=127(y), r2=84(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 127
LDI r2, 84
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
