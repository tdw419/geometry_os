; DESCRIPTION: Renders a magenta box of size 42x42 starting at (294, 6).
; PLAN: r0=294(x), r1=6(y), r2=42(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 6
LDI r2, 42
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
