; DESCRIPTION: Renders a purple box of size 75x53 starting at (117, 185).
; PLAN: r0=117(x), r1=185(y), r2=75(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 185
LDI r2, 75
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
