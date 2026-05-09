; DESCRIPTION: Renders a purple box of size 75x47 starting at (333, 189).
; PLAN: r0=333(x), r1=189(y), r2=75(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 189
LDI r2, 75
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
