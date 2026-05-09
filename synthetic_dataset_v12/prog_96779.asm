; DESCRIPTION: Creates a magenta rectangular region at (112, 205) spanning 42 by 32 pixels.
; PLAN: r0=112(x), r1=205(y), r2=42(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 205
LDI r2, 42
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
