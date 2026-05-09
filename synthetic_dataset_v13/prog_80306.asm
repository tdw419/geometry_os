; DESCRIPTION: Renders a purple box of size 78x120 starting at (297, 120).
; PLAN: r0=297(x), r1=120(y), r2=78(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 120
LDI r2, 78
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
