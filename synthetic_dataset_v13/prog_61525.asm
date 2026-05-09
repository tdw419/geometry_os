; DESCRIPTION: Renders a magenta box of size 44x60 starting at (167, 23).
; PLAN: r0=167(x), r1=23(y), r2=44(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 23
LDI r2, 44
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
