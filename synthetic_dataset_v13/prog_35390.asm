; DESCRIPTION: Renders a purple box of size 51x47 starting at (165, 16).
; PLAN: r0=165(x), r1=16(y), r2=51(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 16
LDI r2, 51
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
