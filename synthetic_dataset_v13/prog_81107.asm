; DESCRIPTION: Renders a purple box of size 76x103 starting at (353, 57).
; PLAN: r0=353(x), r1=57(y), r2=76(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 57
LDI r2, 76
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
