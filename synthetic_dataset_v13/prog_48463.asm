; DESCRIPTION: Draws a black rectangle at (237, 215) with width 38 and height 10.
; PLAN: r0=237(x), r1=215(y), r2=38(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 215
LDI r2, 38
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
