; DESCRIPTION: Renders a magenta box of size 39x51 starting at (25, 109).
; PLAN: r0=25(x), r1=109(y), r2=39(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 109
LDI r2, 39
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
