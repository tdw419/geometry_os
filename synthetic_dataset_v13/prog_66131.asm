; DESCRIPTION: Renders a purple box of size 71x103 starting at (34, 60).
; PLAN: r0=34(x), r1=60(y), r2=71(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 60
LDI r2, 71
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
