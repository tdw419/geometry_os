; DESCRIPTION: Renders a purple box of size 56x36 starting at (210, 133).
; PLAN: r0=210(x), r1=133(y), r2=56(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 133
LDI r2, 56
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
