; DESCRIPTION: Renders a purple box of size 35x113 starting at (165, 89).
; PLAN: r0=165(x), r1=89(y), r2=35(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 89
LDI r2, 35
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
