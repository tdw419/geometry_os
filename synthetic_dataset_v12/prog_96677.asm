; DESCRIPTION: Creates a magenta rectangular region at (324, 130) spanning 42 by 58 pixels.
; PLAN: r0=324(x), r1=130(y), r2=42(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 130
LDI r2, 42
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
