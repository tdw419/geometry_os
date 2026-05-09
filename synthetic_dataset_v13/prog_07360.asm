; DESCRIPTION: Renders a magenta box of size 58x60 starting at (258, 125).
; PLAN: r0=258(x), r1=125(y), r2=58(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 125
LDI r2, 58
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
