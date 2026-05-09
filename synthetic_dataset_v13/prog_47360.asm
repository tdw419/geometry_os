; DESCRIPTION: Renders a purple box of size 118x86 starting at (247, 112).
; PLAN: r0=247(x), r1=112(y), r2=118(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 112
LDI r2, 118
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
