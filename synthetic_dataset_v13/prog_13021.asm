; DESCRIPTION: Renders a purple box of size 93x46 starting at (50, 56).
; PLAN: r0=50(x), r1=56(y), r2=93(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 56
LDI r2, 93
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
