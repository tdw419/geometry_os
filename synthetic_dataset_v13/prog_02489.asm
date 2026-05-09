; DESCRIPTION: Renders a magenta box of size 40x50 starting at (441, 140).
; PLAN: r0=441(x), r1=140(y), r2=40(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 140
LDI r2, 40
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
