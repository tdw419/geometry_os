; DESCRIPTION: Renders a magenta box of size 54x69 starting at (150, 125).
; PLAN: r0=150(x), r1=125(y), r2=54(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 125
LDI r2, 54
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
