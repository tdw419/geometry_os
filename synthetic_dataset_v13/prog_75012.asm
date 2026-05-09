; DESCRIPTION: Creates a magenta rectangular region at (439, 15) spanning 42 by 110 pixels.
; PLAN: r0=439(x), r1=15(y), r2=42(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 15
LDI r2, 42
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
