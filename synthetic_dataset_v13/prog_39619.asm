; DESCRIPTION: Renders a purple box of size 27x104 starting at (213, 144).
; PLAN: r0=213(x), r1=144(y), r2=27(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 144
LDI r2, 27
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
