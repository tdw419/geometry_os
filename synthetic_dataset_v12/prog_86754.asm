; DESCRIPTION: Renders a purple box of size 75x120 starting at (120, 75).
; PLAN: r0=120(x), r1=75(y), r2=75(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 75
LDI r2, 75
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
