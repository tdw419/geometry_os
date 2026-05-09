; DESCRIPTION: Renders a magenta box of size 42x59 starting at (407, 197).
; PLAN: r0=407(x), r1=197(y), r2=42(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 197
LDI r2, 42
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
