; DESCRIPTION: Renders a magenta box of size 36x42 starting at (329, 10).
; PLAN: r0=329(x), r1=10(y), r2=36(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 10
LDI r2, 36
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
