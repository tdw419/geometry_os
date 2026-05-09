; DESCRIPTION: Renders a purple box of size 53x45 starting at (362, 73).
; PLAN: r0=362(x), r1=73(y), r2=53(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 73
LDI r2, 53
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
