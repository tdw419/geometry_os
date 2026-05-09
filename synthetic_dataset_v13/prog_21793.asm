; DESCRIPTION: Renders a purple box of size 72x103 starting at (287, 134).
; PLAN: r0=287(x), r1=134(y), r2=72(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 134
LDI r2, 72
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
