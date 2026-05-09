; DESCRIPTION: Renders a magenta box of size 42x23 starting at (164, 183).
; PLAN: r0=164(x), r1=183(y), r2=42(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 183
LDI r2, 42
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
