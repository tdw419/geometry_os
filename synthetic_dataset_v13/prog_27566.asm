; DESCRIPTION: Renders a purple box of size 61x13 starting at (150, 77).
; PLAN: r0=150(x), r1=77(y), r2=61(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 77
LDI r2, 61
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
