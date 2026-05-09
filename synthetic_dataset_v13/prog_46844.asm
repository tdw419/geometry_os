; DESCRIPTION: Renders a purple box of size 99x21 starting at (57, 133).
; PLAN: r0=57(x), r1=133(y), r2=99(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 133
LDI r2, 99
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
