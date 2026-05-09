; DESCRIPTION: Renders a blue box of size 60x111 starting at (403, 11).
; PLAN: r0=403(x), r1=11(y), r2=60(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 11
LDI r2, 60
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
