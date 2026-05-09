; DESCRIPTION: Draws a black rectangle at (237, 112) with width 90 and height 27.
; PLAN: r0=237(x), r1=112(y), r2=90(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 112
LDI r2, 90
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
