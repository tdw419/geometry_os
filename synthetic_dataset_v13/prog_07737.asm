; DESCRIPTION: Renders a purple box of size 42x66 starting at (47, 77).
; PLAN: r0=47(x), r1=77(y), r2=42(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 77
LDI r2, 42
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
