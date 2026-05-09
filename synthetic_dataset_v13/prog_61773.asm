; DESCRIPTION: Renders a magenta box of size 120x51 starting at (39, 109).
; PLAN: r0=39(x), r1=109(y), r2=120(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 109
LDI r2, 120
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
