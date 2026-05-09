; DESCRIPTION: Renders a purple box of size 92x90 starting at (225, 1).
; PLAN: r0=225(x), r1=1(y), r2=92(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 1
LDI r2, 92
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
