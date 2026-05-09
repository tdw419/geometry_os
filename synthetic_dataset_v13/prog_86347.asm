; DESCRIPTION: Creates a purple rectangular region at (377, 74) spanning 111 by 71 pixels.
; PLAN: r0=377(x), r1=74(y), r2=111(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 74
LDI r2, 111
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
