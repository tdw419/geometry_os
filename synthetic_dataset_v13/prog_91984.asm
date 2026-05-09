; DESCRIPTION: Renders a purple box of size 38x93 starting at (264, 133).
; PLAN: r0=264(x), r1=133(y), r2=38(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 133
LDI r2, 38
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
