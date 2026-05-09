; DESCRIPTION: Renders a magenta box of size 23x82 starting at (210, 70).
; PLAN: r0=210(x), r1=70(y), r2=23(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 70
LDI r2, 23
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
