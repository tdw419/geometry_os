; DESCRIPTION: Renders a magenta box of size 107x111 starting at (274, 134).
; PLAN: r0=274(x), r1=134(y), r2=107(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 134
LDI r2, 107
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
