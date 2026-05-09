; DESCRIPTION: Places a purple 112x111 rectangle at position (61, 71).
; PLAN: r0=61(x), r1=71(y), r2=112(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 71
LDI r2, 112
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
