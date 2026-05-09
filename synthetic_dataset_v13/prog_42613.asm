; DESCRIPTION: Renders a purple box of size 21x99 starting at (61, 6).
; PLAN: r0=61(x), r1=6(y), r2=21(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 6
LDI r2, 21
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
