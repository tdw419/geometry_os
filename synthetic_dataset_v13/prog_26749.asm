; DESCRIPTION: Renders a purple box of size 93x16 starting at (102, 81).
; PLAN: r0=102(x), r1=81(y), r2=93(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 81
LDI r2, 93
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
