; DESCRIPTION: Renders a magenta box of size 70x51 starting at (372, 132).
; PLAN: r0=372(x), r1=132(y), r2=70(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 132
LDI r2, 70
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
