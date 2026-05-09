; DESCRIPTION: Draws a yellow rectangle at (401, 193) with width 47 and height 63.
; PLAN: r0=401(x), r1=193(y), r2=47(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 193
LDI r2, 47
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
