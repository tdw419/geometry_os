; DESCRIPTION: Draws a yellow rectangle at (387, 192) with width 63 and height 13.
; PLAN: r0=387(x), r1=192(y), r2=63(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 192
LDI r2, 63
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
