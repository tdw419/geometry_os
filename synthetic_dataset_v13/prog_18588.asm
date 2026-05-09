; DESCRIPTION: Renders a purple box of size 117x92 starting at (262, 105).
; PLAN: r0=262(x), r1=105(y), r2=117(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 105
LDI r2, 117
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
