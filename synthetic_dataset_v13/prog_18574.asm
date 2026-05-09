; DESCRIPTION: Creates a magenta rectangular region at (193, 42) spanning 17 by 110 pixels.
; PLAN: r0=193(x), r1=42(y), r2=17(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 42
LDI r2, 17
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
