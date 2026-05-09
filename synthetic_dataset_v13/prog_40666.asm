; DESCRIPTION: Renders a purple box of size 27x94 starting at (205, 83).
; PLAN: r0=205(x), r1=83(y), r2=27(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 83
LDI r2, 27
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
