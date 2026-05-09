; DESCRIPTION: Renders a purple box of size 114x52 starting at (50, 103).
; PLAN: r0=50(x), r1=103(y), r2=114(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 103
LDI r2, 114
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
