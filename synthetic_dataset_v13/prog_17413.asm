; DESCRIPTION: Creates a magenta rectangular region at (27, 5) spanning 110 by 11 pixels.
; PLAN: r0=27(x), r1=5(y), r2=110(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 5
LDI r2, 110
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
