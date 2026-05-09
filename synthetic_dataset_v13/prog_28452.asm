; DESCRIPTION: Renders a purple box of size 13x77 starting at (167, 7).
; PLAN: r0=167(x), r1=7(y), r2=13(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 7
LDI r2, 13
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
