; DESCRIPTION: Renders a purple box of size 92x92 starting at (157, 137).
; PLAN: r0=157(x), r1=137(y), r2=92(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 137
LDI r2, 92
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
