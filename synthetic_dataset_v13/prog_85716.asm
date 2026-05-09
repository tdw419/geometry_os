; DESCRIPTION: Creates a magenta rectangular region at (406, 74) spanning 57 by 87 pixels.
; PLAN: r0=406(x), r1=74(y), r2=57(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 74
LDI r2, 57
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
