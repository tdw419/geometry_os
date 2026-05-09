; DESCRIPTION: Renders a magenta box of size 33x107 starting at (58, 42).
; PLAN: r0=58(x), r1=42(y), r2=33(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 42
LDI r2, 33
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
