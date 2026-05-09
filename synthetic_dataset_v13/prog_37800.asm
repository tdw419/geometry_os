; DESCRIPTION: Renders a purple box of size 114x10 starting at (31, 174).
; PLAN: r0=31(x), r1=174(y), r2=114(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 174
LDI r2, 114
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
