; DESCRIPTION: Renders a magenta box of size 12x40 starting at (434, 132).
; PLAN: r0=434(x), r1=132(y), r2=12(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 132
LDI r2, 12
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
