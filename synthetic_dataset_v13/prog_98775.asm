; DESCRIPTION: Renders a magenta box of size 76x108 starting at (300, 82).
; PLAN: r0=300(x), r1=82(y), r2=76(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 82
LDI r2, 76
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
