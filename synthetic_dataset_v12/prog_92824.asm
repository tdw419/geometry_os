; DESCRIPTION: Renders a purple box of size 18x107 starting at (262, 29).
; PLAN: r0=262(x), r1=29(y), r2=18(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 29
LDI r2, 18
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
