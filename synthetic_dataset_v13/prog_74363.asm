; DESCRIPTION: Renders a purple box of size 21x92 starting at (486, 74).
; PLAN: r0=486(x), r1=74(y), r2=21(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 74
LDI r2, 21
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
