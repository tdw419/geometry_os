; DESCRIPTION: Creates a magenta rectangular region at (256, 168) spanning 97 by 42 pixels.
; PLAN: r0=256(x), r1=168(y), r2=97(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 168
LDI r2, 97
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
