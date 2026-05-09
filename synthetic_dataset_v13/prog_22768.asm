; DESCRIPTION: Renders a magenta box of size 83x42 starting at (396, 19).
; PLAN: r0=396(x), r1=19(y), r2=83(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 19
LDI r2, 83
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
