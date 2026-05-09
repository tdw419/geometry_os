; DESCRIPTION: Renders a blue box of size 10x111 starting at (11, 143).
; PLAN: r0=11(x), r1=143(y), r2=10(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 143
LDI r2, 10
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
