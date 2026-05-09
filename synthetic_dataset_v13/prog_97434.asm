; DESCRIPTION: Creates a magenta rectangular region at (294, 65) spanning 49 by 63 pixels.
; PLAN: r0=294(x), r1=65(y), r2=49(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 65
LDI r2, 49
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
