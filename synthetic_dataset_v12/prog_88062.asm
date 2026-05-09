; DESCRIPTION: Renders a purple box of size 104x28 starting at (328, 138).
; PLAN: r0=328(x), r1=138(y), r2=104(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 138
LDI r2, 104
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
