; DESCRIPTION: Renders a magenta box of size 26x115 starting at (168, 110).
; PLAN: r0=168(x), r1=110(y), r2=26(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 110
LDI r2, 26
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
