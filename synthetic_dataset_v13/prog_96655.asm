; DESCRIPTION: Renders a purple box of size 57x111 starting at (215, 40).
; PLAN: r0=215(x), r1=40(y), r2=57(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 40
LDI r2, 57
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
