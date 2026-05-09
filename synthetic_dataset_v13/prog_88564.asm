; DESCRIPTION: Draws a black rectangle at (385, 214) with width 94 and height 42.
; PLAN: r0=385(x), r1=214(y), r2=94(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 214
LDI r2, 94
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
