; DESCRIPTION: Renders a purple box of size 39x77 starting at (265, 152).
; PLAN: r0=265(x), r1=152(y), r2=39(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 152
LDI r2, 39
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
