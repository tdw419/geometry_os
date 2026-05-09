; DESCRIPTION: Creates a magenta rectangular region at (10, 139) spanning 27 by 12 pixels.
; PLAN: r0=10(x), r1=139(y), r2=27(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 139
LDI r2, 27
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
