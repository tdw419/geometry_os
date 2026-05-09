; DESCRIPTION: Renders a purple box of size 80x111 starting at (83, 113).
; PLAN: r0=83(x), r1=113(y), r2=80(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 113
LDI r2, 80
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
