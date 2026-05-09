; DESCRIPTION: Renders a magenta box of size 38x82 starting at (45, 99).
; PLAN: r0=45(x), r1=99(y), r2=38(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 99
LDI r2, 38
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
