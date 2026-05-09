; DESCRIPTION: Renders a purple box of size 92x115 starting at (153, 54).
; PLAN: r0=153(x), r1=54(y), r2=92(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 54
LDI r2, 92
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
