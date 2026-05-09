; DESCRIPTION: Creates a magenta rectangular region at (179, 154) spanning 75 by 47 pixels.
; PLAN: r0=179(x), r1=154(y), r2=75(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 154
LDI r2, 75
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
