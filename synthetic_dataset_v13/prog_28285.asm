; DESCRIPTION: Renders a purple box of size 109x111 starting at (181, 16).
; PLAN: r0=181(x), r1=16(y), r2=109(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 16
LDI r2, 109
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
