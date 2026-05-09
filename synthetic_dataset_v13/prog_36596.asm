; DESCRIPTION: Creates a magenta rectangular region at (75, 20) spanning 16 by 31 pixels.
; PLAN: r0=75(x), r1=20(y), r2=16(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 20
LDI r2, 16
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
