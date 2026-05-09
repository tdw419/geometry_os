; DESCRIPTION: Renders a purple box of size 33x64 starting at (141, 9).
; PLAN: r0=141(x), r1=9(y), r2=33(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 9
LDI r2, 33
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
