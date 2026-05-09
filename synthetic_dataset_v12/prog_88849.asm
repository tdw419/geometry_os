; DESCRIPTION: Renders a purple box of size 18x93 starting at (44, 27).
; PLAN: r0=44(x), r1=27(y), r2=18(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 27
LDI r2, 18
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
