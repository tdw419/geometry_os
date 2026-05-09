; DESCRIPTION: Renders a magenta box of size 107x53 starting at (301, 155).
; PLAN: r0=301(x), r1=155(y), r2=107(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 155
LDI r2, 107
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
