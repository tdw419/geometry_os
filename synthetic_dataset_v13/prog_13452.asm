; DESCRIPTION: Renders a magenta box of size 100x120 starting at (178, 109).
; PLAN: r0=178(x), r1=109(y), r2=100(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 109
LDI r2, 100
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
