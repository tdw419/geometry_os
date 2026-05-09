; DESCRIPTION: Renders a blue box of size 99x57 starting at (363, 6).
; PLAN: r0=363(x), r1=6(y), r2=99(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 6
LDI r2, 99
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
