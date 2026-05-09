; DESCRIPTION: Renders a purple box of size 92x19 starting at (219, 186).
; PLAN: r0=219(x), r1=186(y), r2=92(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 186
LDI r2, 92
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
