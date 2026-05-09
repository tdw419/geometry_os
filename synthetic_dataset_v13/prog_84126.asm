; DESCRIPTION: Renders a magenta box of size 59x50 starting at (65, 165).
; PLAN: r0=65(x), r1=165(y), r2=59(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 165
LDI r2, 59
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
