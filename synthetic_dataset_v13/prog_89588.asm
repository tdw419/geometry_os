; DESCRIPTION: Creates a magenta rectangular region at (279, 42) spanning 48 by 52 pixels.
; PLAN: r0=279(x), r1=42(y), r2=48(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 42
LDI r2, 48
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
