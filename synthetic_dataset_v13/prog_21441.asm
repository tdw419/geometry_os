; DESCRIPTION: Renders a purple box of size 46x90 starting at (176, 43).
; PLAN: r0=176(x), r1=43(y), r2=46(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 43
LDI r2, 46
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
