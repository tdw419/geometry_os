; DESCRIPTION: Draws a yellow rectangle at (237, 193) with width 66 and height 13.
; PLAN: r0=237(x), r1=193(y), r2=66(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 193
LDI r2, 66
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
