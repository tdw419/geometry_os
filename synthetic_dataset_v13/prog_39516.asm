; DESCRIPTION: Renders a purple box of size 92x68 starting at (211, 180).
; PLAN: r0=211(x), r1=180(y), r2=92(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 180
LDI r2, 92
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
