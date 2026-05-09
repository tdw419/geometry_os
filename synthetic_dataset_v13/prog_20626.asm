; DESCRIPTION: Renders a purple box of size 92x35 starting at (387, 197).
; PLAN: r0=387(x), r1=197(y), r2=92(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 197
LDI r2, 92
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
