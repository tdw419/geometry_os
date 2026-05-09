; DESCRIPTION: Renders a purple box of size 92x31 starting at (411, 182).
; PLAN: r0=411(x), r1=182(y), r2=92(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 182
LDI r2, 92
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
