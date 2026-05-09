; DESCRIPTION: Creates a magenta rectangular region at (129, 74) spanning 47 by 110 pixels.
; PLAN: r0=129(x), r1=74(y), r2=47(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 74
LDI r2, 47
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
