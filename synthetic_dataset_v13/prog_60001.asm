; DESCRIPTION: Renders a purple box of size 45x111 starting at (299, 94).
; PLAN: r0=299(x), r1=94(y), r2=45(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 94
LDI r2, 45
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
