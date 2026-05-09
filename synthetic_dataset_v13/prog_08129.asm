; DESCRIPTION: Draws a black rectangle at (401, 65) with width 111 and height 64.
; PLAN: r0=401(x), r1=65(y), r2=111(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 65
LDI r2, 111
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
