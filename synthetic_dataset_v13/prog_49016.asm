; DESCRIPTION: Renders a purple box of size 66x47 starting at (0, 165).
; PLAN: r0=0(x), r1=165(y), r2=66(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 165
LDI r2, 66
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
