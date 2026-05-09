; DESCRIPTION: Creates a magenta rectangular region at (6, 196) spanning 110 by 47 pixels.
; PLAN: r0=6(x), r1=196(y), r2=110(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 196
LDI r2, 110
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
